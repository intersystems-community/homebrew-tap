class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.5.0/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "f88bfa72fbdc4dd366994bd4c8e826305c9fdca045a3009f62cad1c063aa3e1c"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.5.0/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01b9e8927afe4f3581f98ed3c86d7d2e629573bca78f271c3c3a4b365b3793cb"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.5.0/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd39ca1d00c2eca0fda176b35c6763598affa261edf77320385cd550451f33c4"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.5.0", shell_output("#{bin}/ascot --version")
  end
end
