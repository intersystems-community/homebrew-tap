class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.29/iris-dev-macos-arm64"
      sha256 "e683d4ea6bcf62ec754e0af6ea20f1ce501c5c700e09ff64f63f7fbd6564aeb7"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.29/iris-dev-macos-x86_64"
      sha256 "25d39ff0b97a79542ff77fe6a2130bbdc23bf6980bdd9eb8268e6797290a5c55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.29/iris-dev-linux-x86_64"
      sha256 "7760d3095caf2341254772f3adc534e1e8434e86ee4a3496d66907bdf0fde6bc"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.29", shell_output("#{bin}/iris-dev --version")
  end
end
