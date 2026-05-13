class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.17/iris-dev-macos-arm64"
      sha256 "84b1acfa8d7b17b8176b8d8fd024ac80a25cb214d3aac9d2f4fb325fa46e8be5"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.17/iris-dev-macos-x86_64"
      sha256 "fa4423a75eee9e3dfdca560adb9c7ec733984ff7aaac7ae088a0b957f93d16fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.17/iris-dev-linux-x86_64"
      sha256 "7a8118b9764157629259e36b5db00be0de4ec024c561718fda77ea8a6a562e32"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.17", shell_output("#{bin}/iris-dev --version")
  end
end
