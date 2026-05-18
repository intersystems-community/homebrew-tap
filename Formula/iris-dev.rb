class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.27/iris-dev-macos-arm64"
      sha256 "ebbb14e73dd320ed310dab0d535d5244bfdde3568d80b6cce0bf33ac146e22c3"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.27/iris-dev-macos-x86_64"
      sha256 "f6fa6d42c431ab63cab01f16dd4360973d84cdb5681610f03bd56b169bcabfc6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.27/iris-dev-linux-x86_64"
      sha256 "de8a0f2dfa874d34ff7789e6adf178fef134caf8647263b520340e5d4cd787e3"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.27", shell_output("#{bin}/iris-dev --version")
  end
end
