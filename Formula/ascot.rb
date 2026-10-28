class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.4.2/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "e7d5d01586cc6ff786c8f1be8de582a4201a6f4cdd8351087e175e49f21d52ec"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.2/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "111d6e17b620c62d31ce525b5ec108c9dcacef516f8a9ecb9c0d926600a9e995"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.2/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "671669a54b4f36a2c9a221c81f5408a211ce1a6b50eda23ea9b59c1f60b5e714"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.4.2", shell_output("#{bin}/ascot --version")
  end
end
