class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.21/iris-dev-macos-arm64"
      sha256 "cddf4e087c3509c14117ee218d2927371ffadcd67354acd67f77e71effbad2d2"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.21/iris-dev-macos-x86_64"
      sha256 "cca82318ef6fa5c4b655b223b1bc91d5b69d1e6969ac53cdbcd799035dede7f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.21/iris-dev-linux-x86_64"
      sha256 "00812051254970d5fb519c31e7d88346a3b6a024ac48b7404f1b53e4f8302328"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.21", shell_output("#{bin}/iris-dev --version")
  end
end
