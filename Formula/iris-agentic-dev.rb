class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.2/iris-agentic-dev-macos-arm64"
      sha256 "3b5d22d438d4869fca02541f0ac66adccd916a874093b63a0cd152c947de8a14"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.2/iris-agentic-dev-macos-x86_64"
      sha256 "f69804b43d97cc7639447a817c3a8231593bc615473887219ab2fc7ccea413f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.2/iris-agentic-dev-linux-x86_64"
      sha256 "8042e076713f6432528b6d03934c5aae88b934308d3bb3d0bbeca410a817b1d8"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.5.2", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
