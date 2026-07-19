class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.3/iris-agentic-dev-macos-arm64"
      sha256 "a3f4026e1269e40424333f86750d2a70635ca6839855ce2f12831dcbd38783c4"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.3/iris-agentic-dev-macos-x86_64"
      sha256 "a94f8f751fd9a51852513a0ae9fed4ae92c1db0384f28f5066a81824d6a48e43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.3/iris-agentic-dev-linux-x86_64"
      sha256 "4f5662bd1e380de3a5aae897b4b98dd322ba9405580400fab2f55ab90cfcc311"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.3", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
