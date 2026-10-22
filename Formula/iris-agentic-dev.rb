class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.2/iris-agentic-dev-macos-arm64"
      sha256 "fac4b0bc2b6dd67dfe39716b3dfbfea2633540b5e8722e9c625f9531c53058b4"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.2/iris-agentic-dev-macos-x86_64"
      sha256 "7e29340ff5a450cbcd646b004b83e8281e7afbeacc8ed64e84227d9974fccaf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.2/iris-agentic-dev-linux-aarch64"
      sha256 "9313e5836242db32e1910c1b585abaf96c57c41be59dc6fa9cbd8acce51d16e5"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.2/iris-agentic-dev-linux-x86_64"
      sha256 "43187d6ebbbd0ff4ece49afaa935a700c6c2ed5cbb52721545e3bb6938164fdf"
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
