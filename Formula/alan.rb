class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.2.1"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-macos-universal.tar.gz"
    sha256 "99b1b237f4de0534c6b3f1f883318765e0797f2703ae4ecaff1664144413bea8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-linux-x86_64.tar.gz"
    sha256 "d115f41ba9671a9929113aaddf3c035fba52cdb9b65dc562fac78fcbb2973239"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-linux-aarch64.tar.gz"
    sha256 "b0dea3b74a67899d61c7050f625fd28fafb384c55b10cd68801ad9a3cc5859c8"
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
