class IrisDev < Formula
  desc "MCP server connecting AI assistants to InterSystems IRIS — compile, test, debug ObjectScript without leaving the chat"
  homepage "https://github.com/intersystems-community/iris-dev"
  version "0.4.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.16/iris-dev-macos-arm64"
      sha256 "39e46e2d8975203a72c4f21d5f1d344afd358a42eac8c9fdbd5092427503e5df"
    end
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.16/iris-dev-macos-x86_64"
      sha256 "173a682ae15fdc7659e411b4dc474bd4044377ec24a76255cc3623197f77b06d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/iris-dev/releases/download/v0.4.16/iris-dev-linux-x86_64"
      sha256 "d6e4397b9a500f77146ce70e4ccb0592b4533c2fd927bddd1be245ac33445da7"
    end
  end

  def install
    bin_name = "iris-dev-macos-arm64"
    bin_name = "iris-dev-macos-x86_64" if Hardware::CPU.intel? && OS.mac?
    bin_name = "iris-dev-linux-x86_64" if OS.linux?
    bin.install bin_name => "iris-dev"
  end

  test do
    assert_match "iris-dev 0.4.16", shell_output("#{bin}/iris-dev --version")
  end
end
