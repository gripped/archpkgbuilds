# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Jochen Immendœrfer <jochen.immendoerfer@gmail.com>

pkgname=alsa-tools
pkgver=1.2.15
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
  gtk3
  gtk4
)
optdepends=(
  'fltk: for hdspconf, hdspmixer'
  'gtk3: for hdajackretask and hwmixvolume'
  'gtk4: for envy24control'
  'python-pyalsa: for hwmixvolume'
  'python-gobject: for hwmixvolume'
)
provides=($pkgname-emu10k1 $pkgname-ice1712 liblo10k1.so)
source=($url/files/pub/tools/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('b2354fcaccfa316df7847438ad6b4ca3702be4ca88c46878c198a52ca6c659263b61759d4898e7a73acf64dd0e3004c103fa67a1cbdb2e53212f13368173be23'
            'SKIP')
b2sums=('c7790391233546fe6faf5e0bbb58d8067bb71137da25a9d3f02c07dc4abcdd78d361fd9b9a43e8d75a3328a364a4916b64c16d2972718b8bcf9c6d1a4b717882'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

_tools=(
  as10k1
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
