#!/usr/bin/env python3
"""Keep the Fantasma cask aligned with its latest published GitHub release."""

import hashlib
import json
import os
from pathlib import Path
import re
from urllib.request import Request, urlopen


REPOSITORY = "andrew-bierman/fantasma"
CASK = Path(__file__).resolve().parents[1] / "Casks" / "fantasma.rb"
VERSION_LINE = re.compile(r'^  version "(\d+\.\d+\.\d+)"$', re.MULTILINE)
SHA_LINE = re.compile(r'^  sha256 "([0-9a-f]{64})"$', re.MULTILINE)


def version_parts(version: str) -> tuple[int, int, int]:
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise ValueError(f"Invalid Fantasma version: {version!r}")
    return tuple(map(int, version.split(".")))


def release_asset(release: dict) -> tuple[str, str]:
    tag = release.get("tag_name", "")
    if not isinstance(tag, str) or not tag.startswith("v"):
        raise ValueError("Latest Fantasma release has no version tag")
    version = tag[1:]
    version_parts(version)
    filename = f"Fantasma-{version}-arm64.zip"
    expected_url = f"https://github.com/{REPOSITORY}/releases/download/{tag}/{filename}"
    matches = [asset for asset in release.get("assets", []) if asset.get("name") == filename]
    if len(matches) != 1 or matches[0].get("browser_download_url") != expected_url:
        raise ValueError(f"Latest Fantasma release is missing {filename}")
    return version, expected_url


def cask_version(cask: str) -> str:
    matches = VERSION_LINE.findall(cask)
    if len(matches) != 1:
        raise ValueError("Fantasma cask must contain exactly one version")
    return matches[0]


def updated_cask(cask: str, version: str, digest: str) -> str:
    version_parts(version)
    if not re.fullmatch(r"[0-9a-f]{64}", digest):
        raise ValueError("Invalid SHA-256 digest")
    if len(VERSION_LINE.findall(cask)) != 1 or len(SHA_LINE.findall(cask)) != 1:
        raise ValueError("Fantasma cask must contain one version and one SHA-256")
    cask = VERSION_LINE.sub(f'  version "{version}"', cask)
    return SHA_LINE.sub(f'  sha256 "{digest}"', cask)


def latest_release() -> dict:
    request = Request(
        f"https://api.github.com/repos/{REPOSITORY}/releases/latest",
        headers={"Accept": "application/vnd.github+json", "User-Agent": "fantasma-tap-sync"},
    )
    if token := os.environ.get("GITHUB_TOKEN"):
        request.add_header("Authorization", f"Bearer {token}")
    with urlopen(request, timeout=20) as response:
        return json.load(response)


def asset_sha256(url: str) -> str:
    digest = hashlib.sha256()
    request = Request(url, headers={"User-Agent": "fantasma-tap-sync"})
    with urlopen(request, timeout=60) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    cask = CASK.read_text()
    current = cask_version(cask)
    latest, asset_url = release_asset(latest_release())
    if version_parts(latest) < version_parts(current):
        raise ValueError(f"Tap version {current} is newer than latest release {latest}")
    if latest == current:
        print(f"Fantasma cask already at {current}")
        return
    digest = asset_sha256(asset_url)
    CASK.write_text(updated_cask(cask, latest, digest))
    print(f"Updated Fantasma cask: {current} -> {latest}")


if __name__ == "__main__":
    main()
