class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.13/iris-agentic-dev-macos-arm64"
      sha256 "a9c09e4e9a535981d8f73e9584208933da2d40418118f42f5b4e02054cf01c66"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.13/iris-agentic-dev-macos-x86_64"
      sha256 "2874ea7e96d055c76087b23acc124d1a89780884d4151d5acdbb33a4a02c32c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.13/iris-agentic-dev-linux-x86_64"
      sha256 "e72ae09ad28dc54a850773a7d1f7ea927484db26d6902b9aa198272544899550"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.13", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
