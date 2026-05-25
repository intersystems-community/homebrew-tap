class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.6/iris-agentic-dev-macos-arm64"
      sha256 "fd132a7571f43c836f7b3ae180655ca70884b1994ad72f20e091b469fc916146"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.6/iris-agentic-dev-macos-x86_64"
      sha256 "cf5776203ee0f6407012fda91cbd627a8284b81cc98cdc4baa029970f9f4f13a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.6/iris-agentic-dev-linux-x86_64"
      sha256 "a401a53a10ce17401d30cfaa7e55b4893a07ae283f2d9603d7284af3dd87bb9c"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.6", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
