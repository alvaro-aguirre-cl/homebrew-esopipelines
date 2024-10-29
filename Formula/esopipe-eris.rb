class EsopipeEris < Formula
  desc "ESO ERIS instrument pipeline (static data)"
  homepage "https://www.eso.org/sci/software/pipelines/"
  url "https://ftp.eso.org/pub/dfs/pipelines/instruments/eris/eris-kit-1.6.0.tar.gz"
  sha256 "00c5947cb3e7d7390a10b2c9e7865ce33c1aeb10f7562c01f6748f35c52b5822"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?eris-kit-(\d+(?:[.-]\d+)+)\.t/i)
  end

  depends_on "esopipe-eris-recipes"

  def install
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    system "tar", "xf", "eris-calib-#{version_norevision}.tar.gz"
    (prefix/"share/esopipes/datastatic/eris-#{version_norevision}").install Dir["eris-calib-#{version_norevision}/cal/*"]
  end

  test do
    system "true"
  end
end
