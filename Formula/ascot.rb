class Ascot < Formula
  desc "Type checker and code intelligence engine for InterSystems ObjectScript"
  homepage "https://github.com/intersystems-community/ascot"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/intersystems-community/ascot/releases/download/v0.4.1/ascot-cli-universal-apple-darwin.tar.gz"
    sha256 "0a81f7624539b5bf6e47c8df5a7a5c29d421edf814119ba064c87595aabbfe4b"
  end

  on_linux do
    on_intel do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.1/ascot-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7db4ce93776a7ae5525f30ab36ed7fb34907f8ebe38ab5046b350ab9e67822d3"
    end
    on_arm do
      url "https://github.com/intersystems-community/ascot/releases/download/v0.4.1/ascot-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e8ba234d4a10211a5e4bc410fc4189bdca88ac7b83e6a03a7316d37352dccc3"
    end
  end

  def install
    bin.install "ascot"
  end

  test do
    assert_match "ascot 0.4.1", shell_output("#{bin}/ascot --version")
  end
end
