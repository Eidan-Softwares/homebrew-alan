class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.1"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-macos-universal.tar.gz"
    sha256 "c61470d6e409f5727ae0e26ae4af25afaf3f3c1167953a2fd11f48a75c37afdb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-linux-x86_64.tar.gz"
    sha256 "05a86f4ff030aa56847866c2fbf14c45625c7f4be5f52d1024f5cbecdf5df09f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.1-linux-aarch64.tar.gz"
    sha256 "5d7ebc4f4abcb0695fbb3a9f76ff4bba952fd209117d6a353e97f2bdf5c390d5"
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
