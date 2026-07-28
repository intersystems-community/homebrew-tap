class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.8/iris-agentic-dev-macos-arm64"
      sha256 "38b65e9560943d6b5df319b5c8af64f8c77fd2844e88fd60fabcfdc3dfaccc00"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.8/iris-agentic-dev-macos-x86_64"
      sha256 "319dbf1bef0c80315f59cc76421791e295451dadce90f805ca6e2d414956487b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.8/iris-agentic-dev-linux-x86_64"
      sha256 "549c1129ecd95bf909d7130df4d7f041f017cea0138db4ea482a1e65494b9d99"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.8", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
