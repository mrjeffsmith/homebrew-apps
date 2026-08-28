cask "tjs-librewolf" do
  arch arm: "arm64", intel: "x86_64"

  version "154.0.1,2"
  sha256 arm:   "a36564f26f66923773472f252f418367fd8702824060c0a0f3149a3ab23a72bb",
         intel: "6570176d30ac3c21c835954989356f0e70ec3c641570b580518e4db0083bad51"

  url "https://dl.librewolf.net/librewolf/#{version.tr(",", "-")}/librewolf-#{version.tr(",", "-")}-macos-#{arch}-package.dmg"
  name "LibreWolf"
  desc "Web browser focusing on privacy, security, and freedom"
  homepage "https://librewolf.net/"

  livecheck do
    url "https://librewolf.dev/api/v1/repos/librewolf/bsys6/releases/latest"
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)

    strategy :json do |json, regex|
      json["tag_name"]&.[](regex, 1)&.tr("-", ",")
    end
  end

  depends_on :macos

  app "LibreWolf.app"
  command_wrapper "librewolf",
                  executable: "#{appdir}/LibreWolf.app/Contents/MacOS/librewolf"

  zap trash: [
    "~/.librewolf",
    "~/Library/Application Support/LibreWolf",
    "~/Library/Caches/LibreWolf Community",
    "~/Library/Caches/LibreWolf",
    "~/Library/Preferences/io.gitlab.librewolf-community.librewolf.plist",
    "~/Library/Preferences/net.librewolf.librewolf.plist",
    "~/Library/Saved Application State/io.gitlab.librewolf-community.librewolf.savedState",
  ]
end
