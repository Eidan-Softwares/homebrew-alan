class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.2"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.2-macos-universal.tar.gz"
    sha256 "df8354c8f9c8291879bdc5d0139765aac926f3717fde016b3b1531649d009d76"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.2-linux-x86_64.tar.gz"
    sha256 "ead87cbef9e07b6f3f4b5907fdc0111b94fcef76ad2e8dcbd4c4fd433485d7bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.2-linux-aarch64.tar.gz"
    sha256 "8816889f8979c674f17016fd521b53117e67a0ecc62102b04cbe6a3e826d5b16"
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
