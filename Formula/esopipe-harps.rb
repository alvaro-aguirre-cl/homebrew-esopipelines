class EsopipeHarps < Formula
  desc "ESO HARPS instrument pipeline (static data)"
  homepage "https://www.eso.org/sci/software/pipelines/"
  url "https://ftp.eso.org/pub/dfs/pipelines/instruments/harps/harps-kit-3.2.0.tar.gz"
  sha256 "137cc5dc4b2cda9f2615e43423a135baf2b174eece183b7b0b7af832b8abef99"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?harps-kit-(\d+(?:[.-]\d+)+)\.t/i)
  end

  depends_on "esopipe-harps-recipes"

  def install
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    system "tar", "xf", "harps-calib-#{version_norevision}.tar.gz"
    (prefix/"share/esopipes/datastatic/harps-#{version_norevision}").install Dir["harps-calib-#{version_norevision}/cal/*"]
  end

  test do
    system "true"
  end
end
