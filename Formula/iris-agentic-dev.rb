class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.2/iris-agentic-dev-macos-arm64"
      sha256 "45f3dd29c84336fb5b788f5782f6b4e23ae96789fc3c346671be755d55e1d8e1"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.2/iris-agentic-dev-macos-x86_64"
      sha256 "1bf55da90797e5bf2c81ef1b88f5dc403812bb5927c0bbbee63d1d50ac5c74d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.2/iris-agentic-dev-linux-x86_64"
      sha256 "d093b141f4bfc1a0ef597ec165e4d7e354fa5eed7175da9fcfd6a9c6f4ae10d9"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.2", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
