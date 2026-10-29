class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.4.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.4.3/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "ef023746622bee6dcfdb8457a2a6cb89514fa0746399a3ab474e8de3d11956ac"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.3/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0eb09ac321d6cca4d58431ce7a2085a75f41fb9bc51651224306b7776938165d"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.3/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f21a8698ac27802f1f160545121c5c35a26d9aa0e7fd0358098a98c2f19305a"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.4.3", shell_output("#{bin}/ascot --version")
  end
end
