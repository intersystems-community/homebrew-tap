class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.1/iris-agentic-dev-macos-arm64"
      sha256 "a632afa991ae7d4a09d53c5ead48bea5f10bd1c37ab0edb379b00847b82942f3"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.1/iris-agentic-dev-macos-x86_64"
      sha256 "415be4de75862d18abc4e4ad9e64840a2b460fa975e80ea1489f8be940cc9346"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v0.5.1/iris-agentic-dev-linux-x86_64"
      sha256 "9bed280adc1df1e84835be19f5d5bd2ae2cfd53ebba14c222bd7dab18cc63b3f"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev 0.5.1", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
