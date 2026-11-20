class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.4"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-macos-universal.tar.gz"
    sha256 "9a86e3f593c6315819bd7d37b5602047ad9227b955e2dc17a538e1c408dcbc3b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-linux-x86_64.tar.gz"
    sha256 "7d7ea32451b2702f3cffa6bdfd63d869817d1d2408931ceda6dccabf5b78b342"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-linux-aarch64.tar.gz"
    sha256 "07df82612ca6fae292f4873eb9c3439acbc3d8b39a614beaf638324d9dd51ef6"
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
