class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "scode-v0.4.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.23/iris-agentic-dev-macos-arm64"
      sha256 "e1ef63a5e6bfd8ba02140619e793b693910d52bd9ff90fcc7ca1fcc328e57722"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.23/iris-agentic-dev-macos-x86_64"
      sha256 "ccb25c2a26c2c76898e6c85ccd32f6c4900fd3dae7adc95aeca5a9627d9b7266"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.23/iris-agentic-dev-linux-x86_64"
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
    assert_match "iris-agentic-dev scode-v0.4.23", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
