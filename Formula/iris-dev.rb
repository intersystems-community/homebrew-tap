class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.20/iris-dev-macos-arm64"
      sha256 "9f08dad3e48a0dd7eaa26b1eccdc8a436d7360d41a0a7b216939bc79d76ecb80"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.20/iris-dev-macos-x86_64"
      sha256 "248710c05cc9d151fd68e882093e81b72b45403b677791ac72fdbf543ebfd2c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.20/iris-dev-linux-x86_64"
      sha256 "349439320556ec468438dcf0068bf3a577383c0ffcc798fde3dcc5e88e062a48"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.20", shell_output("#{bin}/iris-dev --version")
  end
end
