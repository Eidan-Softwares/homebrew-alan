class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.1"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.1-macos-universal.tar.gz"
    sha256 "24f73900c8cf3ba3d4343e43f70637cc9b09712d8ba1151e4275696f60d18231"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.1-linux-x86_64.tar.gz"
    sha256 "af7b1cad571de87553bb5dfe3e3d0436666dbc36c0e0d140f5e73f59e95a826e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.1-linux-aarch64.tar.gz"
    sha256 "25c9fb154064e1f91c60677f25c8499ba22ace31ad06f5c3ae5be78ff3f754a2"
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
