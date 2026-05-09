class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-arm64"
      sha256 "2cd1a2e763a533bcd71e9e4dc281b4529219b533a2fdb9878662aa25ca1e68e2"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-x86_64"
      sha256 "083510888e48b77c96fbe79255d6149a6587cabbf2d8cfda386bf6b87d206097"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-linux-x86_64"
      sha256 "f041fe3970ca7e9795623974cc7e36f1b30aac619c14417841442efc723bd137"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  def caveats
    <<~EOS
      Quick start (no docker required):
        export IRIS_HOST=localhost
        export IRIS_WEB_PORT=52773
        iris-dev mcp

      Full setup: https://github.com/intersystems-community/iris-dev#readme
    EOS
  end

  test do
    assert_match "iris-dev 0.4.14", shell_output("#{bin}/iris-dev --version")
  end
end
