# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Jochen Immendœrfer <jochen.immendoerfer@gmail.com>

pkgname=alsa-tools
pkgver=1.2.14
pkgrel=1
pkgdesc="Advanced tools for certain sound cards"
arch=(x86_64)
url="https://alsa-project.org/"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
)
makedepends=(
  alsa-lib
  fltk
  gtk2
  gtk3
)
optdepends=(
  'fltk: hdspconf, hdspmixer'
  'gtk2: envy24control, echomixer, rmeddigicontrol'
  'gtk3: hdajackretask'
  'python-pyalsa: hwmixvolume'
  'python-gobject: hwmixvolume'
)
provides=($pkgname-emu10k1 $pkgname-ice1712 liblo10k1.so)
source=($url/files/pub/tools/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('36996eb19c590f3f8deb5831ef4e4a9016578e42172901dd97ebe78a4c6fc14e8d84d8f6639cc37d2db91c1d73727226cf1a5d952c586cfc909768377b04e8c7'
            'SKIP')
b2sums=('e1afda4a4b6f6b1b3c0ab27e7f7bb211f85036c8f874c3f627e7454a7f52777aae68cb07ca05c62c5a12488eeedc062a11290786ee2bfcfe62d72f4ff5f87f51'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

_tools=(
  as10k1
  echomixer
  envy24control
  hda-verb
  hdajackretask
  hdajacksensetest
  hdspconf
  hdsploader
  hdspmixer
  hwmixvolume
  ld10k1
  mixartloader
  pcxhrloader
  # qlo10k1  # disabled, because build is broken
  rmedigicontrol
  sb16_csp
  seq/sbiload
  sscape_ctl
  vxloader
  us428control
  usx2yloader
)

prepare() {
  for tool in "${_tools[@]}"; do
    (
      cd $pkgname-$pkgver/$tool
      autoreconf -vfi
    )
  done
}

build() {
  # not using upstream's global makefile as it's trying to be too clever
  for tool in "${_tools[@]}"; do
    (
      cd $pkgname-$pkgver/$tool
      ./configure --prefix=/usr --sbindir=/usr/bin
      make
    )
  done
}

package() {
  depends+=(
    alsa-lib libasound.so
  )

  for tool in "${_tools[@]}"; do
    make DESTDIR="$pkgdir" install -C $pkgname-$pkgver/$tool
  done
}

# vim:set ts=2 sw=2 et:
