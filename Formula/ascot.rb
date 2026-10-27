class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.4.0/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "533f08612e0c1eebcc7dcde7a746e0fa3c302016ebb2af9fd5d3fc6a700220f2"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.0/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e14aa26efbadd9f95bff26dc46c2f810fa49d37e5caa9834f19ed01cb187178"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.0/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "451bfa52861188b2ead34b187fa6b9f833d620912157bbf00deb2455c7380b0f"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.4.0", shell_output("#{bin}/ascot --version")
  end
end
