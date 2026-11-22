class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.4"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.4-macos-universal.tar.gz"
    sha256 "1430e71533c063516663a6b454866e7cb979349e4317ad26f7f9ffdac1d6f084"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.4-linux-x86_64.tar.gz"
    sha256 "8124e3b6618d2030c546c7c1ce28cdeac6e8a9383a96aafb04d8bd280ffe73e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.4-linux-aarch64.tar.gz"
    sha256 "14bed07f66fffd4a3f6ed7927d1cc4d1e816d6a26968e40d873aeeb1b65ebd81"
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
