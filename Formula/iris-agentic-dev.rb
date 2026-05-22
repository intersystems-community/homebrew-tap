class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.0/iris-agentic-dev-macos-arm64"
      sha256 "a0d9286e7ed1ad035e1501d2f5319535d5992e6144ffedd62c418fa70e7cd62c"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.0/iris-agentic-dev-macos-x86_64"
      sha256 "9c4c261ca8dda286293dbccf218ed231ee1976e702b59c8db840cd1f5674083f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.0/iris-agentic-dev-linux-x86_64"
      sha256 "32c52411fb939a8816d3ddad5a7437409e02328d1c2fc657ab468507364bb84a"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.0", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
