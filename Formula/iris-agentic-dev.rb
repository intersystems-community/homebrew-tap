class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.6/iris-agentic-dev-macos-arm64"
      sha256 "a05b13e961969eb1b4bda09bbc776f783a58bf1a6e00cc9add0a034167c6ca76"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.6/iris-agentic-dev-macos-x86_64"
      sha256 "fd430af5972d27095e5b5ed903a871e6bdd3cf88d28dbf7149acbacfc77fc980"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.6/iris-agentic-dev-linux-x86_64"
      sha256 "114641d8b0f4eff6c3d029227f2b0ef7dc7dd13b7da4652fc6a41d0d33335549"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.6", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
