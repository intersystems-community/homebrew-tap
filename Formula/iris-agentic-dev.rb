class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.1/iris-agentic-dev-macos-arm64"
      sha256 "c5b9453286ec273e5f8c9309300dca2bcdb7dd1d32f1b927efaa22c93beabe11"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.1/iris-agentic-dev-macos-x86_64"
      sha256 "093dde829821bb3b4a8460d40186c5239286d76ca90fbde83e087af3ec5cffa8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.1/iris-agentic-dev-linux-x86_64"
      sha256 "2497552de70722bd493463cc77ed0219c40fb6eb29205b6cef7305a1712bb91a"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.1", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
