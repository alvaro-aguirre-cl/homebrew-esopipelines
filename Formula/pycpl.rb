class Pycpl < Formula
  desc "Python Language Bindings for CPL"
  homepage "https://www.eso.org/sci/software/pycpl/"
  url "https://ftp.eso.org/pub/dfs/pipelines/libraries/pycpl/pycpl-1.0.0.tar.gz"
  sha256 "aa9ee7e26d88a751494b9484542ea2285acbed3ff026821ff6bc54540aba3def"
  license "GPL-2.0-or-later"
  revision 1

  livecheck do
    url "https://ftp.eso.org/pub/dfs/pipelines/libraries/pycpl/"
    regex(/href=.*?pycpl[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "cpl@7.3.2"
  depends_on "python@3.11"

  def install
    system "python", "-m", "pip", "install", *std_pip_args(build_isolation: true), "."
  end

  test do
    system "true"
  end
end
