class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.7.0/iris-agentic-dev-macos-arm64"
      sha256 "a1117d91d0d4c73945421777d8a795bf34b8d2b00952a9d6ca6b4db1944aaf5f"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.7.0/iris-agentic-dev-macos-x86_64"
      sha256 "3505132346a607892df9855a13c0d22186b18456e239dbf704d905c19516fcf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.7.0/iris-agentic-dev-linux-x86_64"
      sha256 "a2df4ceefbc281a3ab2a501ab244c1f32c5f401463970d821928e754d3b486b5"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.7.0", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
