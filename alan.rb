class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.5"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.5-macos-universal.tar.gz"
    sha256 "a568d1a316f22f893fb17a069100c325bef06a3e03f8352c89ace0a96c331016"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.5-linux-x86_64.tar.gz"
    sha256 "1e32b15454631b917ca476bf371be731d78a714403e38ef62ee802c4ea8b767e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.5-linux-aarch64.tar.gz"
    sha256 "ccaf3cd4a35c6c0fdfbf86d33d987b40c9337dcaec7305f761099a58f5e3fe0f"
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
