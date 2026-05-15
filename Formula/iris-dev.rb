class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.23/iris-dev-macos-arm64"
      sha256 "1198095e49a1d201d072be2c7cb30d088a08025f987d8b3cc3a250f8ae56cfc8"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.23/iris-dev-macos-x86_64"
      sha256 "1a667d1dc00b9015799a80ef0a7c1ec067cfd144a0ad0b915e836328fc6986dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.23/iris-dev-linux-x86_64"
      sha256 "c31d8b565a18ea2508d93a89c57b658b82aa785bdfd19f8431924a6fa32a4639"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.23", shell_output("#{bin}/iris-dev --version")
  end
end
