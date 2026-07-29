class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.10/iris-agentic-dev-macos-arm64"
      sha256 "b4afb238c01402bb77113e6ed1c026d3725ec8c68a1993adc51add10af64168f"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.10/iris-agentic-dev-macos-x86_64"
      sha256 "803307a6ac4c8b830c23058425959c6298c3da623d04f9bffecd6fbb4c74bb50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.10/iris-agentic-dev-linux-x86_64"
      sha256 "df49883c7f3ad4e39523d4f6da239275ec30e99365b72152f015fbf54b5258f5"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.10", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
