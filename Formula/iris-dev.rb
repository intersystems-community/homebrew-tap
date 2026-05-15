class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.25/iris-dev-macos-arm64"
      sha256 "a8b9299d4c73d15a6e2abaec424f9ff67160928a6dc00930537cd8bed99ab341"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.25/iris-dev-macos-x86_64"
      sha256 "d6865715101ab62d1ed7adf305b88d6dfc1dfd672b7910606841d81be8d413fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.25/iris-dev-linux-x86_64"
      sha256 "5b57887c0703a35431d09f82ebcc68217c5c0bb5357c2700b3c03ebc0b74d136"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.25", shell_output("#{bin}/iris-dev --version")
  end
end
