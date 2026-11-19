class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.0"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.0-macos-universal.tar.gz?v=2"
    sha256 "fa721f03bde86943731e9f2b28d268faca065aeabb05e47c20b609dbe03de2c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.0-linux-x86_64.tar.gz?v=2"
    sha256 "422024394cb2300cd1b890490ec49696d7f9dee93de5ab20a4ee1b341afad38b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.0-linux-aarch64.tar.gz?v=2"
    sha256 "7bb0fe7ee36a99b68f328232935f367779aacfe040f43b5892adbc35079210dc"
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
