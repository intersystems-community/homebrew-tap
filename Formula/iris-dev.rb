class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.15/iris-dev-macos-arm64"
      sha256 "1bac214e9b5fab2381bd4e9e567daa2d8fcd18a2b30fee0c044ae318c4bf2bdb"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.15/iris-dev-macos-x86_64"
      sha256 "e46129d614d17e118763292ef57a6aca7bb2da550895ba63809440d92e6e0672"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.15/iris-dev-linux-x86_64"
      sha256 "5cd85a3c485ac825e6df0a19037acb509a0ed10aa8f455fd249568911be7c391"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.15", shell_output("#{bin}/iris-dev --version")
  end
end
