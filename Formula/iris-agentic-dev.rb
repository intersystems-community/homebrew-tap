class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.1/iris-agentic-dev-macos-arm64"
      sha256 "4805bc525bc7bdc74a69aa745e97e8fe8d1df6361af49db082db254a6f72d58d"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.1/iris-agentic-dev-macos-x86_64"
      sha256 "165464abf117565513b96d3fe7c837a66d4e5d0766fc91339519f1d590c33e15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.1/iris-agentic-dev-linux-x86_64"
      sha256 "eb8da1978e5db0550838e2e3ab4c7117f32b1513df6dbc072f99d1160a53bbba"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.1", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
