# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=reaper
pkgver=7.60
pkgrel=1
pkgdesc="A complete digital audio production application for computers"
arch=(
  aarch64
  x86_64
)
url="https://reaper.fm"
license=(LicenseRef-EULA)
groups=(pro-audio)
depends=(
  aribb24
  alsa-lib libasound.so
  fontconfig
  gcc-libs
  glibc
  hicolor-icon-theme
  libglvnd
  libx11
  libxi
)
makedepends=(
  xdg-utils
)
optdepends=(
  'ffmpeg4.4: for video rendering'
  'jack: for JACK support'
  'pulseaudio: for PulseAudio support'
  'python: for Python plugins'
  'reapack: for managing reaper plugins'
  'sws: for the SWS/S&M plugin extension'
)
provides=(
  clap-host
  lv2-host
  vst-host
  vst3-host
)
options=(!debug)
source=(redistribution.eml)
source_x86_64=(
  https://reaper.fm/files/${pkgver::1}.x/reaper${pkgver//.}_linux_x86_64.tar.xz
)
source_aarch64=(
  https://reaper.fm/files/${pkgver::1}.x/reaper${pkgver//.}_linux_aarch64.tar.xz
)
sha512sums=('a2746fa0b847dbd587f24983569b01120f4706306242223c8857360219569d965df8c25c98f31d68140eb66d7458384653b5b042f7433a84957a990d8e587d92')
sha512sums_aarch64=('a896d1bcc5fa30aabe7acc64f0ee7399f8f70b2ab1d19507cccd113ef2de19b6e36ec71d985c504153c6a73c88fde266e7e083dd9770437c551e97291c3dbb6f')
sha512sums_x86_64=('a2d6937eb69bbbe64c9a992d46ab4b6d4b63108b91d1a6bf2a7a349ab8e14f57a75c26d420bb2a0a44c800524baae690aece3d42b0157fbf08e7e7d157bce6f9')
b2sums=('ddbf47cb04ad9e9fb937b09a0ea0c88d4416ceaabc4e420750ff9303447a50a323060f018bd9f52907a1a5e4ea3ebe685eb336d1b6f4bbbc89a12e2370be8728')
b2sums_aarch64=('cac2d9669719dccc5ff2f06449205186622169f0c176118f1fde67548d6fb2624380ee57c6ce835614cffe87b2107906bc88a9c19a9bb10286b88505f89e99da')
b2sums_x86_64=('622ed9ae434a9a76bdff32f102c5ccb4cd11591fab2ce1f6b186b0e990f54144aadf9af1dcf38f863b445f671f3997f7c5976f1ddd82cec857a71ff66667b20b')

package() {
  cd ${pkgname}_linux_$CARCH
  XDG_DATA_HOME="$srcdir/xdg/" ./install-reaper.sh --install "$pkgdir/usr/lib" --integrate-user-desktop
  # remove unneeded uninstallation script
  rm -v "$pkgdir/usr/lib/${pkgname^^}/uninstall-reaper.sh"

  # strip $pkgdir from XDG desktop Exec line
  sed -e "s|$pkgdir||g" -i "$srcdir/xdg/applications/"*.desktop
  # install only required files for XDG integration
  install -vDm 644 "$srcdir/xdg/applications/"*.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm 644 "$srcdir/xdg/mime/packages/"*.xml -t "$pkgdir/usr/share/mime/packages/"
  install -vDm 644 "$srcdir/xdg/icons/hicolor/256x256/apps/"*.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

  # add convenience symlink to PATH
  install -vdm 755 "$pkgdir/usr/bin"
  ln -sv /usr/lib/${pkgname^^}/$pkgname "$pkgdir/usr/bin/$pkgname"

  # install EULA and redistribution allowance
  install -vDm 644 "$pkgdir/usr/lib/${pkgname^^}/EULA.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "$srcdir/redistribution.eml" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
