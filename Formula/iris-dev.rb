class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.28/iris-dev-macos-arm64"
      sha256 "d3770d7a5147abdae6550b9ac072e502861503b5549de81c0aa82d650603c7b7"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.28/iris-dev-macos-x86_64"
      sha256 "e3d6b83e2d0f1daee522e634db24f38124cbce5e8067a9989320b9a4009e1542"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.28/iris-dev-linux-x86_64"
      sha256 "343371a581dd4eb85cd8518fb34ec440138eef83cd100b23d6da685674af7e92"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.28", shell_output("#{bin}/iris-dev --version")
  end
end
