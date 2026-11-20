class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.6"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.6-macos-universal.tar.gz"
    sha256 "349e7e42106f460f2cfee8d7ce6bab0fab5ee1ed5749454986dc7835d4ff62bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.6-linux-x86_64.tar.gz"
    sha256 "54b174e6aa4fd142a4911001cacdf2847645ec2ba24c4f02743edbeb6eebfe74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.6-linux-aarch64.tar.gz"
    sha256 "281befea6609f7470cb737fec62e01b47d60776dfedae9a5188d5c5dfb3e45fd"
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
