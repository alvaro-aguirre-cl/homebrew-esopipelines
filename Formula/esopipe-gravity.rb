class EsopipeGravity < Formula
  desc "ESO GRAVITY instrument pipeline (static data)"
  homepage "https://www.eso.org/sci/software/pipelines/"
  url "https://ftp.eso.org/pub/dfs/pipelines/instruments/gravity/gravity-kit-1.6.7-2.tar.gz"
  sha256 "1eafb832c91df9ea05b4758d0b250c30d7b57a6d0ff5103d9aac25fe778d9c1e"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?gravity-kit-(\d+(?:[.-]\d+)+)\.t/i)
  end

  depends_on "esopipe-gravity-recipes"

  def install
    version_norevision = version.to_s[/(\d+(?:[.]\d+)+)/i, 1]
    system "tar", "xf", "gravity-calib-#{version_norevision}.tar.gz"
    (prefix/"share/esopipes/datastatic/gravity-#{version_norevision}").install Dir["gravity-calib-#{version_norevision}/cal/*"]
  end

  test do
    system "true"
  end
end
