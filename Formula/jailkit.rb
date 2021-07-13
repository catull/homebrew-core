class Jailkit < Formula
  desc "Utilities to create limited user accounts in a chroot jail"
  homepage "https://olivier.sessink.nl/jailkit/"
  url "https://olivier.sessink.nl/jailkit/jailkit-2.22.tar.bz2"
  sha256 "985564721366eaf5c6482dd17e91647d21e70b4c9803c74847d649d8c8c2bbcf"

  livecheck do
    url :homepage
    regex(/href=.*?jailkit[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 arm64_big_sur: "9b1811caafbdea42e49b14308f79e70faccbb3f38402184f974e52026c220a57"
    sha256 big_sur:       "58761380572c700e95ae78a62c76fecb897a390837d38748651622b5762c8681"
    sha256 catalina:      "488323402cd9c3487e515ebe4ed8b4e056188af3d125ee063a1056c58c1c61a4"
    sha256 mojave:        "6aeb6044ff3ba537d8575fea45053da11764549b72d545df3b962b6a6d3ee68c"
    sha256 high_sierra:   "7ab554fa425961fe843c0533b360b5f0eb7dcc39ed707e6f757e0c4e328d930c"
  end

  depends_on "python@3.9"

  def install
    ENV["PYTHONINTERPRETER"] = Formula["python@3.9"].opt_bin/"python3"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make", "install"
  end
end
