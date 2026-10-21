class IrisAgenticDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-agentic-dev"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.1/iris-agentic-dev-macos-arm64"
      sha256 "b3467045cafe8cddd8ab176af274ad9dacb41366d029fa8559d06a9f6e68cb0a"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.1/iris-agentic-dev-macos-x86_64"
      sha256 "51bb4868f02afc72d658aeff799348a90386a7f726dec83cf504941dca29ca64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.1/iris-agentic-dev-linux-aarch64"
      sha256 "45d263c61a4e83ee00eb2d648559318b362134a52c70c848c87f69cd4f4bbf2a"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-agentic-dev/releases/download/v1.6.1/iris-agentic-dev-linux-x86_64"
      sha256 "97ffe266e3a9a19b8ae484ffbee5786c61c3adab74254215ec97e1ef03cc3ec7"
    end
  end

  def install
    bin_name = "iris-agentic-dev-macos-arm64"
    bin_name = "iris-agentic-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-agentic-dev-linux-aarch64" if OS.linux? && Hardware::CPU.arm?
    bin_name = "iris-agentic-dev-linux-x86_64" if OS.linux? && Hardware::CPU.intel?
    bin.install bin_name => "iris-agentic-dev"
  end

  test do
    assert_match "iris-agentic-dev #{version}", shell_output("#{bin}/iris-agentic-dev --version")
  end
end
