class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.2.4"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.4-macos-universal.tar.gz"
    sha256 "a6b58595f185e9021949172ff40df086a11ba75ef12ce5c0757c0f8f1e0e08ec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.4-linux-x86_64.tar.gz"
    sha256 "82b6e76ad12a4579d6b38ca3ce816c1449041222019fa1a11a2587518c623c9e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.4-linux-aarch64.tar.gz"
    sha256 "020bd26ba15d11b6f15959f2ed50a61f1977b45f671d753cdf3d2aa4e45cf50b"
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
