class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.20/iris-agentic-dev-macos-arm64"
      sha256 "1b92ea0d25cdb92150f4a0113ab2327b8041773f082b6181e9abe87a2e6718fa"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.20/iris-agentic-dev-macos-x86_64"
      sha256 "6bb382aee5142fd181ce5164f693e688dc0c895de9c584e061a738fb0b93bd6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.20/iris-agentic-dev-linux-x86_64"
      sha256 "24592afaa94c3b96377683984cc6b5252473e7bc4202230e36ea639cec38f236"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.20", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
