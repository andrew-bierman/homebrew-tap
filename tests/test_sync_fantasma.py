import unittest

from scripts.sync_fantasma import cask_version, release_asset, updated_cask, version_parts


class SyncFantasmaTests(unittest.TestCase):
    def setUp(self):
        self.cask = 'cask "fantasma" do\n  version "0.4.11"\n  sha256 "' + "a" * 64 + '"\nend\n'

    def test_release_asset_requires_exact_versioned_zip(self):
        url = "https://github.com/andrew-bierman/fantasma/releases/download/v0.4.12/Fantasma-0.4.12-arm64.zip"
        release = {"tag_name": "v0.4.12", "assets": [{"name": "Fantasma-0.4.12-arm64.zip", "browser_download_url": url}]}
        self.assertEqual(release_asset(release), ("0.4.12", url))
        release["assets"][0]["browser_download_url"] = "https://example.com/file.zip"
        with self.assertRaises(ValueError):
            release_asset(release)

    def test_rewrite_changes_only_version_and_verified_sha(self):
        updated = updated_cask(self.cask, "0.4.12", "b" * 64)
        self.assertEqual(cask_version(updated), "0.4.12")
        self.assertIn('  sha256 "' + "b" * 64 + '"', updated)
        self.assertTrue(updated.startswith('cask "fantasma" do\n'))
        self.assertTrue(updated.endswith('end\n'))

    def test_malformed_release_or_cask_fails_closed(self):
        with self.assertRaises(ValueError):
            version_parts("0.4.12-beta")
        with self.assertRaises(ValueError):
            release_asset({"tag_name": "v0.4.12", "assets": []})
        with self.assertRaises(ValueError):
            updated_cask(self.cask + self.cask, "0.4.12", "b" * 64)
        with self.assertRaises(ValueError):
            updated_cask(self.cask, "0.4.12", "bad")


if __name__ == "__main__":
    unittest.main()
