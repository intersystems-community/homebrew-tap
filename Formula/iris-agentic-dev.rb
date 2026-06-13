class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.14/iris-agentic-dev-macos-arm64"
      sha256 "b60f0299929605354513af366c20a1e365aa990e9c5f16aeeae21e8e9a9af70e"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.14/iris-agentic-dev-macos-x86_64"
      sha256 "7dc9f618c00c260b7f02e88decf83c52591dc8cf9c4da5d4e9fcf25f1390dc12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.14/iris-agentic-dev-linux-x86_64"
      sha256 "29c2eff0d1ad801ce3960d0760bf2a51a3649b1e731afc705ce98f4fed422b60"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.14", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
