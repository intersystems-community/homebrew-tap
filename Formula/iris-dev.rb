class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.18/iris-dev-macos-arm64"
      sha256 "a29299f52160285193f7829670c6e0f91b520517070955fa947e889323dfaa01"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.18/iris-dev-macos-x86_64"
      sha256 "29a6bc39b8bcc58943d9a9c39f298a32bb95e389860081359e333a14af4ac3fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.18/iris-dev-linux-x86_64"
      sha256 "6d5a062682b1c7b6888a8576136ae90eaadcbfb6e4fdfbdb1255a3b05cecf50b"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.18", shell_output("#{bin}/iris-dev --version")
  end
end
