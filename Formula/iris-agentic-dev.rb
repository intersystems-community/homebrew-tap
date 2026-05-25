class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.4/iris-agentic-dev-macos-arm64"
      sha256 "5324cfe32c9cb787790f7e03aa8d6eef8f79b45db777f3eaf6e812f749aa1a12"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.4/iris-agentic-dev-macos-x86_64"
      sha256 "a56b248bf3a35593089b770f7f3a9a57238bdb6299229163b246afc49c1f7291"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.4/iris-agentic-dev-linux-x86_64"
      sha256 "f5f31c124682a3b368eab03a64fedd163d6ed33b23a69ca215fe48a662e00eb5"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.4", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
