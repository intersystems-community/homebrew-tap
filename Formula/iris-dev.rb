class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.22/iris-dev-macos-arm64"
      sha256 "886989be2f30f29aebb92e05418bc720f4ba6127ef4274067d5369f9ab20b5b6"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.22/iris-dev-macos-x86_64"
      sha256 "b23a832cab67d8f2b18f554250221aec0877046d54c0d186fd7eb615dfc32a98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.22/iris-dev-linux-x86_64"
      sha256 "759e0def43bd8dbcfe1531e260116433b306fb931e7abd78dfbccb9ff00d7f64"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.22", shell_output("#{bin}/iris-dev --version")
  end
end
