class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.9/iris-agentic-dev-macos-arm64"
      sha256 "5bf6a00203367f752f55213b1844b356ef9d3db64d7ea0d6bcd372eed6218323"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.9/iris-agentic-dev-macos-x86_64"
      sha256 "baf5b594fa9b6ae0e12842bf2e674fd4c7342ed0f0955951692bd01be7cc7d77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.9/iris-agentic-dev-linux-x86_64"
      sha256 "f48faadf7031a80fb0101cd3a85ac81540afc72f335841cb9d5acf12d1f5470c"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.9", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
