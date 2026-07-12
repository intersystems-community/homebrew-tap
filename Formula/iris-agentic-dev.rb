class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.8.0/iris-agentic-dev-macos-arm64"
      sha256 "b52c9dc35959b80449eccc1d729abcf89c01c59a9449ea8904000ce7674354a4"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.8.0/iris-agentic-dev-macos-x86_64"
      sha256 "1c8c431b278a8ea41accf009de546eb09b1c3dbccd4f853868c58cac8dd297b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.8.0/iris-agentic-dev-linux-x86_64"
      sha256 "a5fce0cb404946001a28797e6e45e78d3fbe65212a2f2d1a2e98b211c2412156"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.8.0", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
