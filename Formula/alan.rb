class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.9"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.9-macos-universal.tar.gz"
    sha256 "4ae72bd77e6113b6b10d3cdbbdb7fc43c69d5c14693c117b87f7885f53cf2b51"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.9-linux-x86_64.tar.gz"
    sha256 "065f7cfe09e33c938e239081e02a276eb4c746c213bbf6ecc39b8b6ab9ba8a87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.9-linux-aarch64.tar.gz"
    sha256 "84c3ebbcb1c6c8f1d7b61a847f0f20464cac6ca35300bac7a92c172b21a10e39"
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
