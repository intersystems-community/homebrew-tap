class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.5/iris-agentic-dev-macos-arm64"
      sha256 "fe7c731d002de4181cb3391bb399cfa77f399044cfc8a3f886e132d1760813d9"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.5/iris-agentic-dev-macos-x86_64"
      sha256 "91a9760be82068a1457fd2d06eb92eb164fa3982560f05b52621bd576e6eeb8d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.5/iris-agentic-dev-linux-x86_64"
      sha256 "ccc7231d7fdbc60ceb81870a5eade27c268432b9f0b659ae196aedfbc0a8df58"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.5", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
