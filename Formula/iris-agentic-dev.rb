class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.7.1/iris-agentic-dev-macos-arm64"
      sha256 "dddfba3790db2e5641e69613c84555b5751da222fcf34f8dbc32857cc4373002"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.7.1/iris-agentic-dev-macos-x86_64"
      sha256 "3036eb38fcdc087f52976723068883634c844f0e781909a05d0cb738887b92d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.7.1/iris-agentic-dev-linux-aarch64"
      sha256 "822d76bc2dd9651dd1c50017ff8b1b2616f5178a50966cfda55a21811e469623"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.7.1/iris-agentic-dev-linux-x86_64"
      sha256 "402163c86c4867c257b5911c60275c94dd04320e2c21a72315abc47487d293ef"
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
