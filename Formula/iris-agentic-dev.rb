class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.5.0/iris-agentic-dev-macos-arm64"
      sha256 "cfae461e715945bdc0d3f6462ec1795c88f31a161573cca2c5872cda08c050d9"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.5.0/iris-agentic-dev-macos-x86_64"
      sha256 "b9f54111852bc969652b6ace2cbbbc90020e6c4646d9034c8d86ff70256aef59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.5.0/iris-agentic-dev-linux-aarch64"
      sha256 "3698ebc2baccec1bf852a2ce7fcf3ac312fcefbcf2525df49a8839919ad068c1"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.5.0/iris-agentic-dev-linux-x86_64"
      sha256 "a9660b4bf0a74498c7dcd6a371b7c1900e4ad8be237cd8f9187a4f406a83dcee"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-aarch64" if OS.linux? && Hardware::CPU.arm?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux? && Hardware::CPU.intel?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev #{version}", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
