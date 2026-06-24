class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.17/iris-agentic-dev-macos-arm64"
      sha256 "3625d532dce8fa6170e658612f40d35f110c5980caa5592ba2db63087891f8c4"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.17/iris-agentic-dev-macos-x86_64"
      sha256 "19c00012b2fd0d1ef6894b25959afe6ff158e9f23b6420774e5b8faa454ac8a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.17/iris-agentic-dev-linux-x86_64"
      sha256 "2ee5770ef0252bec31c19c6624049af820c76dd16c83c213237c0c6974a90f6c"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.17", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
