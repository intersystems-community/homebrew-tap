class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.16/iris-agentic-dev-macos-arm64"
      sha256 "0089d8f8210012018fd7156ab9494d218a90d12ca5e94f1f99dc772704f8e32d"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.16/iris-agentic-dev-macos-x86_64"
      sha256 "ec15b9083edc86e3684cf176fe8391dbefccb2c6569e8b3773fe786b42f34307"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.16/iris-agentic-dev-linux-x86_64"
      sha256 "ac7ebdeaa5cdbe75f4701e31366f7904fe89fcfc3ff3c54df6a6b4a1d2595e7d"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.16", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
