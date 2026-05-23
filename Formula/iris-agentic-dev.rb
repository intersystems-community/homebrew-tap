class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.2/iris-agentic-dev-macos-arm64"
      sha256 "856df28356ecf03ee6ce77177afe877a60c1bd25133ac34902bbe0daf9f114ad"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.2/iris-agentic-dev-macos-x86_64"
      sha256 "060adc87887c988a3f53f6e613c07f22a9a98d8e54712c01708ee1c3228bfda4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.2/iris-agentic-dev-linux-x86_64"
      sha256 "91db97c3597bac0da46d9f70aae31b2e27dd7538ae97c88882b66af30cb33a2b"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.2", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
