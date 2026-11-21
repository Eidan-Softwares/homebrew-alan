class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.0.9"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.9-macos-universal.tar.gz"
    sha256 "74c144d014d5067f4a383346841c86aa24fc2f9f60e38d407f623669420f3ac4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.9-linux-x86_64.tar.gz"
    sha256 "e854bb8f78ee8d35b070f1f877121aae3dddbf33b0905a376e51a4dd6b84fa88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.0.9-linux-aarch64.tar.gz"
    sha256 "8396c17319ff5fa91fb40a77ce7c0bcd936caaff6a796b3fcca0fc2a168bd9e6"
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
