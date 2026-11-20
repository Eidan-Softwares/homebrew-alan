class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.8"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.8-macos-universal.tar.gz"
    sha256 "55c24bb42330dbd11a3c58b6b5d8768fb8a26dfc7ba0aec8c0c77c07b66871e0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.8-linux-x86_64.tar.gz"
    sha256 "ebfc964c2c2129f71deffcbd6b944eb84bd130a8e9a0c344fdcc6b90af74b24f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.8-linux-aarch64.tar.gz"
    sha256 "4364baef342469f7ff4de5bea82e234e07598a8ed992f44bbb033d2a5c7f672b"
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
