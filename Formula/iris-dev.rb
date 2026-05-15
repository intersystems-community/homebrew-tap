class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.26/iris-dev-macos-arm64"
      sha256 "07b532446549e58c718d2e1de3d06ef77023d8b09ac02efb9778c7f943b0e762"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.26/iris-dev-macos-x86_64"
      sha256 "c28d6d3119e1898721813dec2ea9f136171a9d1b6d8c3f9e6522ca196635349c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.26/iris-dev-linux-x86_64"
      sha256 "ddc1a7155ba017b851a850930246302387d054650c02392163e798abdbeef4dc"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.26", shell_output("#{bin}/iris-dev --version")
  end
end
