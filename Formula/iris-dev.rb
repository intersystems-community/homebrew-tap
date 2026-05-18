class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.30/iris-dev-macos-arm64"
      sha256 "77bebbdc499c6b8138609c6ee5e34b693343d076807a4214a23e895c9f371c34"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.30/iris-dev-macos-x86_64"
      sha256 "1a8973bed23f5c000b03005e8d83c98f44f0f8db199255fde407e91b8c49585e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.30/iris-dev-linux-x86_64"
      sha256 "ac0bfa95d03b297d96044a90cdeb3f74b4f3b5944e8433a89c5929957d0f1d81"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.30", shell_output("#{bin}/iris-dev --version")
  end
end
