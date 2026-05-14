class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.19/iris-dev-macos-arm64"
      sha256 "c103c4f3ef332c04c2cd79e9c614d170ccb1f82a60bdffe8c80147254b65ba8c"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.19/iris-dev-macos-x86_64"
      sha256 "c8e130cdcba7bda7f34c3033e5afbddf48c3acf27be7809b9721ce9242b31f97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.19/iris-dev-linux-x86_64"
      sha256 "dcc076eb1edb491ca118c5b1b4cc917371d5d8812c5ad2c3b9ac51659129d815"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.19", shell_output("#{bin}/iris-dev --version")
  end
end
