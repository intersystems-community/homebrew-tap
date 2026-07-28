class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.9/iris-agentic-dev-macos-arm64"
      sha256 "34b60c519261f088024f24ab20aec3a786b33ab0675b219973b225274a0893e8"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.9/iris-agentic-dev-macos-x86_64"
      sha256 "e7aecca8c3d5e43d4c97557d67b5d5286af0dd1b67875c868fb33f5afe71046b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.9/iris-agentic-dev-linux-x86_64"
      sha256 "9799e685e1c45a129aabafcb49bf60aec47381b56fa52a66973ce05de971feb0"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.9", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
