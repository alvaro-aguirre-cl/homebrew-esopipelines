class EsopipeXshooRecipes < Formula
  desc "ESO XSHOOTER instrument pipeline (recipe plugins)"
  homepage "https://www.eso.org/sci/software/pipelines/"
  url "https://ftp.eso.org/pub/dfs/pipelines/instruments/xshooter/xshoo-kit-3.6.8.tar.gz"
  sha256 "e50f7172d65de8b8f54fc47a333d49a5fa6db34aabe097bbc1a3449f455ab2b9"
  license "GPL-2.0-or-later"
  revision 1

  livecheck do
    url :homepage
    regex(/href=.*?xshoo-kit-(\d+(?:[.-]\d+)+)\.t/i)
  end

  depends_on "pkg-config" => :build
  depends_on "cfitsio@4.2.0"
  depends_on "cpl@7.3.2"
  depends_on "curl"
  depends_on "erfa"
  depends_on "esorex"
  depends_on "gsl@2.6"
  depends_on "telluriccorr"

  def install
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    system "tar", "xf", "xshoo-#{version_norevision}.tar.gz"
    cd "xshoo-#{version_norevision}" do
      system "./configure", "--prefix=#{prefix}",
             "--with-cfitsio=#{Formula["cfitsio@4.2.0"].prefix}",
             "--with-cpl=#{Formula["cpl@7.3.2"].prefix}",
             "--with-erfa=#{Formula["erfa"].prefix}",
             "--with-curl=#{Formula["curl"].prefix}",
             "--with-telluriccorr=#{Formula["telluriccorr"].prefix}",
             "--with-gsl=#{Formula["gsl@2.6"].prefix}"
      system "make", "install"
    end
  end

  test do
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    assert_match "xsh_mdark -- version #{version_norevision}", shell_output("#{HOMEBREW_PREFIX}/bin/esorex --man-page xsh_mdark")
  end
end
