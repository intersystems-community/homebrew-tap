class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.24/iris-dev-macos-arm64"
      sha256 "3d246b45a7a65c3d54ef0a954dcab82e6dcc33c5562c64a03d04506d31ff85df"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.24/iris-dev-macos-x86_64"
      sha256 "00c452b12b5d4db6ff4216d2a7a4eaf8caf63ef69d94e9f7a0e768f6e6a6c24b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.24/iris-dev-linux-x86_64"
      sha256 "cfedbec8b28ffb91ed54c4e9fe2b4247b631313ae77f8a310b5dde4b33c33119"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.24", shell_output("#{bin}/iris-dev --version")
  end
end
