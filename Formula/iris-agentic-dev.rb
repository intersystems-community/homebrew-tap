class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.4/iris-agentic-dev-macos-arm64"
      sha256 "0b7391adbdc859d98c05c065edb26f54155d991f2289bd86022203b9f8300324"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.4/iris-agentic-dev-macos-x86_64"
      sha256 "42b21f642aec390fcba1d6ce78ad8f4f0a73f3391b3015e0c66115dfdd3bb1ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.4/iris-agentic-dev-linux-x86_64"
      sha256 "8c9c599a39218f6de8443a918f213508abf8619b8a1755e2c1363d5111d9a51e"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.4", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
