class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.2.1"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-macos-universal.tar.gz"
    sha256 "2209d0e276b433e75ff4df24cd0ab064d78bfc471c79bdf2914f4a6d399b359c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-linux-x86_64.tar.gz"
    sha256 "a3680570a3411a8187df843e43b2a0ea7af500becaf4a807b0d05e7c4a75fa3d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.2.1-linux-aarch64.tar.gz"
    sha256 "1d8f8a6dc0af18e1f125e945b49a030fe2d84750f0634e0f4a9d662973d6cced"
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
