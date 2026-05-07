class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-arm64"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-x86_64"
      sha256 "PLACEHOLDER_X86_64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-linux-x86_64"
      sha256 "PLACEHOLDER_LINUX_X86_64"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  def caveats
    <<~EOS
      Quick start (no docker required):
        export IRIS_HOST=localhost
        export IRIS_WEB_PORT=52773
        iris-dev mcp

      Full setup: https://github.com/intersystems-community/iris-dev#readme
    EOS
  end

  test do
    assert_match "iris-dev #{version}", shell_output("#{bin}/iris-dev --version")
  end
end
