class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.5/iris-agentic-dev-macos-arm64"
      sha256 "84d06569635aeca886fbade3d4bdd0f5f449c761a702b3cadb40b73312df4e95"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.5/iris-agentic-dev-macos-x86_64"
      sha256 "5a12a8dd9b751fe6b6c801c35f37621c80d77eadb2b0bd9fb66fd39cbbc25b7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.9.5/iris-agentic-dev-linux-x86_64"
      sha256 "e5e200ce962db27c6e2e484ac30306ef6eab1ff7ac83e9f96db0625757b3a946"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.9.5", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
