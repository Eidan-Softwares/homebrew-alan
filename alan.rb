class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.8"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.8-macos-universal.tar.gz"
    sha256 "0f1670411a18cc089ef9510245acde74293d4b38c03c0c2fecfaaed148f9f66c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.8-linux-x86_64.tar.gz"
    sha256 "1c36c01cd1c04f4eb13f5cc6ebc4d1177909354274467087511585c0707bff35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.8-linux-aarch64.tar.gz"
    sha256 "18dc6d88ee4ec4658e72c38d8eec8be27618df6f3c8f1bd952422b7022a5118a"
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
