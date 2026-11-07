class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.5.1/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "491b4d65312df8b6abb0fab56b5a15b450014757ac4a7a78892ecda5871d8070"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.5.1/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79d2e3031db3e163fb2bd470bf234bead15abf07ce0719167aaacf041d8e1349"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.5.1/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a761daa9e19ad252a2c85e313b8e820941b539900255a2b60e2c6ceaad450be"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.5.1", shell_output("#{bin}/ascot --version")
  end
end
