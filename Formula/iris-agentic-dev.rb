class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "scode-v0.4.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.24/iris-agentic-dev-macos-arm64"
      sha256 "f587c27f290af36b399607d2c4f76b818f4fdedc4ff26171bf20daf20d487989"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.24/iris-agentic-dev-macos-x86_64"
      sha256 "2d3db516d9ba470b2eb1b34e1823ea29883dc62737794fc91a00fac2dc6664ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/vscode-v0.4.24/iris-agentic-dev-linux-x86_64"
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
    assert_match "iris-agentic-dev scode-v0.4.24", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
