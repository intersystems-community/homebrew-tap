class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.3.1/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "d516b74cc2568585b01ba5ab92b0eedba16aecea85c46165a288e3def9a54bf5"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.3.1/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "610e276b3185553ac070685325ca65a1389ff40fa3693605c007049d3d96f620"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.3.1/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "380b6ff867c974b0ab4a134db5267e4a70e8bcd8ed8da5e131d47a57daede213"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.3.1", shell_output("#{bin}/ascot --version")
  end
end
