class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.21/iris-agentic-dev-macos-arm64"
      sha256 "c2bff65c7c201feb9a0bfacc5431e8c4810699db867e8625c14cb225e82b742a"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.21/iris-agentic-dev-macos-x86_64"
      sha256 "a14650d26617622206f05c8260076171a399e81c3c1694b80a055da42b74248b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.21/iris-agentic-dev-linux-x86_64"
      sha256 "ff86d85a1bfab64b3ab8db2666434f81ca7685bc1a5f8b6c3a5358c7b46832db"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.21", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
