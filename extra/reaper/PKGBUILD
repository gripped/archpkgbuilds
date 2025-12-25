# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=reaper
pkgver=7.57
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
sha512sums_aarch64=('60a3f81bd5e17b1900255ad166314a643f93da771d5468a4697d87ca8af57638bb9e4de1af91eb603d1e3b810c843a91929ff9c744edecbc19c5184c908abe48')
sha512sums_x86_64=('b57b4588ad8fe9162548d4cc4e4c31f20fb4533be3be72e1992570c76d81fea1be1b90e5e87a0cc21573f873750e177c549e542eb4c71b2d2e5c9f94af0bd10d')
b2sums=('ddbf47cb04ad9e9fb937b09a0ea0c88d4416ceaabc4e420750ff9303447a50a323060f018bd9f52907a1a5e4ea3ebe685eb336d1b6f4bbbc89a12e2370be8728')
b2sums_aarch64=('8da1d9c75a76dc7565fb5653589a0073bd467689e0f8418d20be1db233dbf11d7e702a5226655307b37a5d1e4c42bae26980bccd61e7c77181a72e6a8bfbea0d')
b2sums_x86_64=('f0efd219cc84780c5b5cb4d0e49820c5617f91719a7cea024a57cb1611242ddc1734c98856292d7a0d33a6ec81640aa63cdd6a2d53e6a012d0a58215d13aceeb')

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
