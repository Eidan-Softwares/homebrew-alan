class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.0"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.0-macos-universal.tar.gz"
    sha256 "7f6fb192b9b16a3953173eecafc1fa83ca74893eba7fc638878d3b6a0e2901ce"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.0-linux-x86_64.tar.gz"
    sha256 "f6e4e28b74dd3952f3bbad95ad9cc48e42261bd4a217d1fbb672bfcf0556709f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.0-linux-aarch64.tar.gz"
    sha256 "105f09aa1795f97e773e237e44b590d2394cc0381e4b87c94a70c1f97d425836"
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
