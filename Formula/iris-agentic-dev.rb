class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.0/iris-agentic-dev-macos-arm64"
      sha256 "3ea5e1327a7a6c5c529ca06483325e73f7a20d89bc593143d1396625e0f70c63"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.0/iris-agentic-dev-macos-x86_64"
      sha256 "d628cd2e2447a08f1284f5bd994ece3b082e07a13d70d4a30a6ea4a44e6dcfb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.0/iris-agentic-dev-linux-x86_64"
      sha256 "40d46615bdef659c8768ea1c9f82670de9b4a2e253f981a63ee9fd59205a75c2"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.5.0", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
