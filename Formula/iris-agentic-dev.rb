class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.0/iris-agentic-dev-macos-arm64"
      sha256 "0bb683e86bb3c9dde7e60d9704c2ae47563e7de21720d81fcaf508d8468061df"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.0/iris-agentic-dev-macos-x86_64"
      sha256 "b2567c0090bbfdc32bdd0800ea486a60038a80976c5a1c1c6eaec1602179da2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.0/iris-agentic-dev-linux-x86_64"
      sha256 "4ac41b5e41526401a0beae5fce6f1aa47b806d5c92a54580adea1862b5777676"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.0", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
