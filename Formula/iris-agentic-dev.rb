class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.3/iris-agentic-dev-macos-arm64"
      sha256 "febf24e6d84f79dea983102d53b398a3544b9606694e614c3be94b9d62dfc24f"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.3/iris-agentic-dev-macos-x86_64"
      sha256 "84cc9ed45bbe6802b4e42252ca2ee8ba5d557f6ddc11b0b46972b4e1c8ebaf5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.3/iris-agentic-dev-linux-x86_64"
      sha256 "0aaaeeb8d2412fab8e6302fb1a6716939c7740c93202b7216c975c27e3b9943d"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.3", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
