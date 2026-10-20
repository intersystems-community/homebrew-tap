class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.0/iris-agentic-dev-macos-arm64"
      sha256 "92e6fd7578a31b80165d2d345f01ab623fa2beb42b1e6201794a504c9d135f5c"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.0/iris-agentic-dev-macos-x86_64"
      sha256 "02957472d4e023d907df7f71aa914e21dfcc761298b80ea67bfc5fa3d637a923"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.0/iris-agentic-dev-linux-aarch64"
      sha256 "ef2ddc24d92d3cf3fada25c731318d087559294881c7e0709876f3c2be4c66cc"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.0/iris-agentic-dev-linux-x86_64"
      sha256 "12b11b5342cd5972985d5eba3c29bd7693fa1eb759ae4bfc2f8f9e927036efb3"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-aarch64" if OS.linux? && Hardware::CPU.arm?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux? && Hardware::CPU.intel?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev #{version}", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
