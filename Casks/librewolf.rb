cask "librewolf" do
  arch arm: "arm64", intel: "x86_64"

  # Replace the version and SHA256 string whenever a new update drops
  version "124.0-1" 
  sha256 arm:   "ARM64_SHA256_HASH_HERE",
         intel: "INTEL_SHA256_HASH_HERE"

  url "https://gitlab.com{version}/librewolf-#{version}-macos-#{arch}-package.dmg"
  name "LibreWolf"
  desc "Web browser focusing on privacy, security, and freedom"
  homepage "https://librewolf.net"

  app "LibreWolf.app"

  zap trash: [
    "~/Library/Application Support/LibreWolf",
    "~/Library/Caches/LibreWolf",
    "~/Library/Preferences/io.gitlab.librewolf-community.librewolf.plist",
    "~/Library/Saved Application State/io.gitlab.librewolf-community.librewolf.savedState",
  ]
end
