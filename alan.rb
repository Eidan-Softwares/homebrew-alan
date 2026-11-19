class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.1"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-macos-universal.tar.gz"
    sha256 "fe57c7434cf07d516d59d54667a2beac46a86e788560fa6ddabfeaaee7a13b6a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-linux-x86_64.tar.gz"
    sha256 "59b8c5bbd60ed5fff5a7b89cd30cf8cb77b2eb487b819530d2f1a70dfce8c4d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-linux-aarch64.tar.gz"
    sha256 "207d2d92a01e632bd6bf10da59cad2acebedf30056871ee3e3e40d19eb4124b0"
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
