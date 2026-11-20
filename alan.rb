class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.5"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.5-macos-universal.tar.gz"
    sha256 "e816a6e7a47f3e883b63ff54ede103133a9d77602e0625ae813d26b1a421a845"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.5-linux-x86_64.tar.gz"
    sha256 "9c4a806daefd4ac4418d272d0e3214eef0063ca19f735eb963984791e5a6e7c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.5-linux-aarch64.tar.gz"
    sha256 "2291ecb838177b2f7079d480b1d6e0038e6d469e5b4b06ca83b58860b27a1fce"
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
