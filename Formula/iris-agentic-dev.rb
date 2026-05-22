class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.3/iris-agentic-dev-macos-arm64"
      sha256 "a3347310b451f7f8df76528e3691a3473e200faeaf071e622cc432cfa2dc68b3"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.3/iris-agentic-dev-macos-x86_64"
      sha256 "35c0dac2f73b1460b3ded6c1f70a09cb91d3f406ee44cd88565d11d945589b4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.3/iris-agentic-dev-linux-x86_64"
      sha256 "4bd58849645205683c0328ad9a9e62c7403ddab6a5166dceff3e4565fb334f25"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.5.3", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
