class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.3"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.3-macos-universal.tar.gz"
    sha256 "40ec92cf4f2a0bf30cd9e26dadc28bf04762d7da055a91486c98c031c044f042"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.3-linux-x86_64.tar.gz"
    sha256 "20c6e3c70c0f875355f1d44ca504b7f8777ffb820e1d0f2771dc6c1f862ce009"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.3-linux-aarch64.tar.gz"
    sha256 "dc21359901416a1e276e25b9a84337287c4c949c3206ede04cbdcdcbeaebde51"
  end

  def install
    bin.install "bin/alan"
    if Dir.exist?("lib/alan")
      (lib/"alan").install Dir["lib/alan/*"]
    end
    if Dir.exist?("examples")
      pkgshare.install "examples"
    end
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    assert_match "ALAN Programming Language", shell_output("#{bin}/alan --version")
  end
end
