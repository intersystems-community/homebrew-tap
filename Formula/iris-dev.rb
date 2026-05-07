class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-arm64"
      sha256 "a9e95e8820a1874781386edf9daf8880cb7d883e1d2ede11deb5c101c7e7a11d"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-macos-x86_64"
      sha256 "e62809b66db446d1fd1b147d48d22342e5859169a0ca140317d2989e51c86569"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v#{version}/iris-dev-linux-x86_64"
      sha256 "737634f88ea317032a7ad3e68342c2a4219e28370bd38ef32d5e2cdff6e86400"
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
    assert_match "iris-dev #{version}", shell_output("#{bin}/iris-dev --version")
  end
end
