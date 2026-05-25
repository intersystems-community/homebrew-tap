class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.7/iris-agentic-dev-macos-arm64"
      sha256 "3cb2ca962ec8fca4cea6df1337fa5621a3dbd1e30366f4705c2b9734a7430cc1"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.7/iris-agentic-dev-macos-x86_64"
      sha256 "4f1ca5d112099326476c225400a5e5bb39fb06bfa6e5b97bb602b751c8e61dbd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.7/iris-agentic-dev-linux-x86_64"
      sha256 "327ea81c8a62ebc7460dfca448e223f1a8eb4983e9707adaec3e60a1e3660ad4"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.7", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
