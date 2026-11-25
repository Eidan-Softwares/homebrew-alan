class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.2.2"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.2-macos-universal.tar.gz"
    sha256 "38fe3fd65dd931b017248b1d3583d779e9b6ddc3af25e58ca2e650ad54aeacff"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.2-linux-x86_64.tar.gz"
    sha256 "ad183a704d58183e0a57572f8419f11fe0b0a2f0f399d9e617430c8741ce4637"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.2-linux-aarch64.tar.gz"
    sha256 "9cb4fc3f7c17d552f449012d0492ce61ec21ebf0c27a3745b96ab5db1c5d8209"
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
