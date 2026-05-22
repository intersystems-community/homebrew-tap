class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.4/iris-agentic-dev-macos-arm64"
      sha256 "4077fcb8d67cc6892182774e51a4af21c9ebe081ae689ba841e7f50e18904359"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.4/iris-agentic-dev-macos-x86_64"
      sha256 "ab6c7e2d715a4a3ede83567e14e16ab4ef4aca333e875a2a6f314f26a7abe30e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.4/iris-agentic-dev-linux-x86_64"
      sha256 "5a4dea19a6cf1d5a6c6b511a1866874f2ac70b4a14332505b9c20317d4f29fde"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.5.4", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
