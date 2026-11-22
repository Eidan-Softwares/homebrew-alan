class Alan < Formula
  desc "The Human-Centric Programming Language"
  homepage "https://alan.eidansoftwares.in"
  version "1.1.3"
  license "Proprietary"

  if OS.mac?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.3-macos-universal.tar.gz"
    sha256 "540309ff0d4e4f9e2717a8d84a21521ea594d2bba7cf0d51f5e952e134f8e467"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.3-linux-x86_64.tar.gz"
    sha256 "0a1256c5dc64658e31c52aa989e0bb760d61a6f8e500cec084b1e246b390c4cf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://alan.eidansoftwares.in/downloads/alan-v1.1.3-linux-aarch64.tar.gz"
    sha256 "b2874fa0627d3979595c5c65ec59e38f30b64f8c36b6accfd10b19bdff29b96c"
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
