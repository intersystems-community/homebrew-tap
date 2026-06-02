class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.12/iris-agentic-dev-macos-arm64"
      sha256 "4a7f23da98515c56a8be183a42d7d09fbc86fc49792bf51fbef5e2d57dcfbea1"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.12/iris-agentic-dev-macos-x86_64"
      sha256 "19736a8db722d2a0cd09642544e3a4bb04a838cc47b529d64a703d7e492dede5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.12/iris-agentic-dev-linux-x86_64"
      sha256 "fbcf1bb1104105d041cc2b2efcf8269db9c5011fb32b8212d75740e9718c4217"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.12", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
