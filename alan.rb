class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.2.0"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.0-macos-universal.tar.gz"
    sha256 "bcbb21776f63b3441c496ef7027d8c6134c65e6d84aa4dc8dddc7eb35686e525"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.0-linux-x86_64.tar.gz"
    sha256 "4405eccd40335dfc24632f1e13573ff278daa957328fec65eb165e6015baf542"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.0-linux-aarch64.tar.gz"
    sha256 "10c6acf03a6321cd8cd53bf96a9a1e776de9c56c04f57b43f3a458f63194c6f4"
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
