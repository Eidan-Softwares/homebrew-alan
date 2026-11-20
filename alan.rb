class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.7"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.7-macos-universal.tar.gz"
    sha256 "4f57d75bd449d3e94b29ec7756c6786088dae74cead51d852546bdd806338756"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.7-linux-x86_64.tar.gz"
    sha256 "731a9192cad3b820cfedb4c4660c64b4c4acbc40325d140d6bcf0571e9891b9d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.7-linux-aarch64.tar.gz"
    sha256 "837b36d71eaa94ecfba52695466840cfcda8ba372177cc5a1f420f4569945896"
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
