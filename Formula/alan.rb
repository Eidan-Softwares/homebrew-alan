class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.6"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.6-macos-universal.tar.gz"
    sha256 "16768f639735b166d76666227345686fc6fcf7a0d05bb00b16167747a5842d4a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.6-linux-x86_64.tar.gz"
    sha256 "eb28e762120becda9eeb3ec3047b96691b1f7ee45e800423a3c7893ee31b4f66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.6-linux-aarch64.tar.gz"
    sha256 "9bf19f4aefcdfaaf0c800ee7c9a6b30cfa47769400c7d44ba62ca62a6b40e08a"
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
