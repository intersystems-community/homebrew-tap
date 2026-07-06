class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.19/iris-agentic-dev-macos-arm64"
      sha256 "b8e0e98cc51d3ba6e38c97f50b606659d4335b11bba92832764b76800277f10e"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.19/iris-agentic-dev-macos-x86_64"
      sha256 "0347dfb3c2add0f9ea1af5b7188c8a7da79b134117e41e63d602ddcb25e97d06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.19/iris-agentic-dev-linux-x86_64"
      sha256 "9154e98760ca21f1d1949fb77fe72ea9fe66fd762a641012100b460817ba1e44"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.19", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
