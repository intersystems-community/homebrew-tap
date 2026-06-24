class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.6.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.15/iris-agentic-dev-macos-arm64"
      sha256 "b2caab65e9022cfc43a8c4d5639da3ebf977acd258c132b0e09ca25c0b9e30e5"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.15/iris-agentic-dev-macos-x86_64"
      sha256 "3ba61c7a23ee4f91b11d68df7d00a05dc4adef86068c7c3cae5ff55137ff91d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.6.15/iris-agentic-dev-linux-x86_64"
      sha256 "121e6718c7f3d8d8c883b029e9db784163df479616fe7cf19a23f7d077531e93"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.6.15", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
