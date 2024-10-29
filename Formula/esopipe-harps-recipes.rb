class EsopipeHarpsRecipes < Formula
  desc "ESO HARPS instrument pipeline (recipe plugins)"
  homepage "https://www.eso.org/sci/software/pipelines/"
  url "https://ftp.eso.org/pub/dfs/pipelines/instruments/harps/harps-kit-3.2.0.tar.gz"
  sha256 "137cc5dc4b2cda9f2615e43423a135baf2b174eece183b7b0b7af832b8abef99"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?harps-kit-(\d+(?:[.-]\d+)+)\.t/i)
  end

  depends_on "pkg-config" => :build
  depends_on "cpl@7.3.2"
  depends_on "curl"
  depends_on "erfa"
  depends_on "esorex"
  depends_on "gsl@2.6"

  def install
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    system "tar", "xf", "harps-#{version_norevision}.tar.gz"
    cd "harps-#{version_norevision}" do
      system "./configure", "--prefix=#{prefix}",
                            "--with-cpl=#{Formula["cpl@7.3.2"].prefix}",
                            "--with-gsl=#{Formula["gsl@2.6"].prefix}",
                            "--with-erfa=#{Formula["erfa"].prefix}",
                            "--with-curl=#{Formula["curl"].prefix}"
      system "make", "install"
    end
  end

  test do
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    assert_match "espdr_mbias -- version #{version_norevision}", shell_output("#{HOMEBREW_PREFIX}/bin/esorex --man-page espdr_mbias")
  end
end
