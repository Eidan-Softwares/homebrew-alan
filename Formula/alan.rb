class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.7"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.7-macos-universal.tar.gz"
    sha256 "3bbcc51a775f03a9c511fdc867ec3be9ada3c2a908dbb9309b8c856a0a80acdc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.7-linux-x86_64.tar.gz"
    sha256 "97ede3d3e8add9865fb27a652f4d34bc06dbf35edaf26a3afb8e39eae1aafd03"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.7-linux-aarch64.tar.gz"
    sha256 "cd5def2c8953d43c29a2cb5880757ddd2f9b7512732f3fa06f8162bb0a213d4d"
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
