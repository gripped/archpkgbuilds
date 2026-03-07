# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=reaper
pkgver=7.64
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
  libgcc
  libstdc++
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
sha512sums_aarch64=('cfe1db15ce1d0ee0c777232d0b6b9c46d7d6498a8762c15ce9b3ff9dcaa7f976db1f4101ecd062d6700f0cd8906fcae700e7e1d6d49b44425403b04077126d65')
sha512sums_x86_64=('bcab89fc496b736b725b555cb6e2df4fade86da90e00b00a0e75d64b72ffd46dec691192301e1eb48390ac877114d4f5586933adf19d74c8dd3f1cd3ce4f459c')
b2sums=('ddbf47cb04ad9e9fb937b09a0ea0c88d4416ceaabc4e420750ff9303447a50a323060f018bd9f52907a1a5e4ea3ebe685eb336d1b6f4bbbc89a12e2370be8728')
b2sums_aarch64=('ebd1fe94b4f1a3be9d8ab707e12cfb51fbe52d495e357bae76fb9a4adb2d967b0e1690a001d3884f5789e0a309221209ac6d16fcddf013d963c99d19eb337880')
b2sums_x86_64=('56311528c141d7794c1d3a8d3ee644979032694a07ad308eaa9299ac736ab001be86c1bb6e54bd7682479b8c7162514fc8d2e758995ca743b32d869ae762bbb8')

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
