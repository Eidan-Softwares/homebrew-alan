class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.2"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.2-macos-universal.tar.gz"
    sha256 "857f37b4c70c73d2273dc959b1832ce7d72c6d20a3f491543819bb7e8819bc83"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.2-linux-x86_64.tar.gz"
    sha256 "06704ddc4e33920d71c2337a0b8f6592f9387dbeac709f996a2d4f87cc8584cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.2-linux-aarch64.tar.gz"
    sha256 "0cd09407cc6f987c9672035723d0949ed8b3724c6bda5d9b9cf10f1beff637f8"
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
