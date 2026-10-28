# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=reaper
pkgver=7.83
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
sha512sums_aarch64=('7a324cecd2fff3700a6b8f6fba354b55ba6fad55ef24c7d6e2b3e73b559e3cf4333abd207c146c331b158b4485cb95941376ffb77515047477b8997fce8676e8')
sha512sums_x86_64=('a90dd082a81b4d3af1946420e543191a19e2db6c2d8411e3324956bc663d64fd80ace59cbbd7c130bd70e2218f25deb4574726ac795fc962b43dfebaa3524374')
b2sums=('ddbf47cb04ad9e9fb937b09a0ea0c88d4416ceaabc4e420750ff9303447a50a323060f018bd9f52907a1a5e4ea3ebe685eb336d1b6f4bbbc89a12e2370be8728')
b2sums_aarch64=('f831929d42fac96697d55b519b9fb00d4c459509f39ab13d04f14c30e956afb3e778d0041742e3d93bcb24e1a0eff845ba3d7ee1a3cd9b2846cc4561a4cf366b')
b2sums_x86_64=('83cca2cbbc487b0aee9a8336b5190bcbfae35f5fc866eb22a3efe11619efa8bd1808c9c445fe657b562cf9bbd8ae6da40c5bffeb54efc6d742a9e1c43d470e95')

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
