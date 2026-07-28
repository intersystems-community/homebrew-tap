class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.7/iris-agentic-dev-macos-arm64"
      sha256 "f1e952fbe9de0800f8cd8da2907dda44e43166d56f132cbd1f5db25768ce5dde"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.7/iris-agentic-dev-macos-x86_64"
      sha256 "3906457e0647785fbfa61a16a3124561a3db7ff2081bf58afa31847e522a4d93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.7/iris-agentic-dev-linux-x86_64"
      sha256 "0f2d9f8f64cf8b1dc027be48da43df091acdced5d293e0d68472608e305721fa"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.7", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
