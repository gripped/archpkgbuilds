# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=reaper
pkgver=7.77
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
  'ffmpeg: for video rendering'
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
sha512sums_aarch64=('a0e67d474da06db4d66c359ecab756c00295ef8006ebd6af47ed7d6d264db40a251ad86830496456b2be8098f301e4df09c8ac9461f0b622401b7edf15a99811')
sha512sums_x86_64=('7503ad858801dde51b6db97c86bc678ce3db850e9c21b3ee1379ebd2c4ac75bab5b4e732bbd31da2f7c00ea295a3bd16cec1c3f68d9e62c9bbc86d4f3c98fbcb')
b2sums=('ddbf47cb04ad9e9fb937b09a0ea0c88d4416ceaabc4e420750ff9303447a50a323060f018bd9f52907a1a5e4ea3ebe685eb336d1b6f4bbbc89a12e2370be8728')
b2sums_aarch64=('46d2c0a983fa88d20c7610f6f0e3a6625a98f88635ade0c363d748a1bdac06741c2c82e03e6a051bd4d69965c4959a32069292f0537a91901b0e3fb3017cfbb4')
b2sums_x86_64=('235822fe34638baa74f869e3968f7a6f57f7b9c5cb93979069eac366615131a5919c0216bb955ba7af462a44defe360a3089d7cbea04c32ab0da725691b0cf89')

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
