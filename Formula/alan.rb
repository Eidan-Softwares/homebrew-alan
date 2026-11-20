class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.4"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-macos-universal.tar.gz"
    sha256 "28179aad84e5a38f633a00296b67dd8fa82b75bdb2d5387ecf7b1ea98627113e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-linux-x86_64.tar.gz"
    sha256 "7de4a1e2c7f021ad09e34d2f30e84c059b170c6ffb2a0104f3f222bab45fd17b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.4-linux-aarch64.tar.gz"
    sha256 "7fc72686933d6ee362fb674d0a12a0c5931a8c22543add3d4b5145c150543f2a"
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
