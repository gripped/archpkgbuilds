# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Originally by: Denis Smirnov <detanator@gmail.com>

_pkgname=igt-gpu-tools
pkgname=intel-gpu-tools
pkgver=2.2
pkgrel=2
pkgdesc="Tools for development and testing of the Intel DRM driver"
arch=(x86_64)
license=(MIT)
url='https://gitlab.freedesktop.org/drm/igt-gpu-tools'
depends=(libdrm libpciaccess cairo python xorg-xrandr libprocps kmod libxv libunwind peg systemd)
makedepends=(python-docutils swig xorg-util-macros xorgproto meson)
source=(https://xorg.freedesktop.org/releases/individual/app/${_pkgname}-$pkgver.tar.xz{,.sig})
sha512sums=('20032b90e397ca73f9f8f5b453034fffc09e28372adddebd1a71b1323235e3e379bf452d5a4dd76b895e4c47df67595051c16b8a1488249e5aae946f6a35258c'
            'SKIP')
validpgpkeys=('775965B85650195ACE77E18D7370055DB74C2475'
              'E1996E8A119F43C4BA2BE889D8C620766EA3F69D'
	      '4CF7FC248DC2CE8F34BBE48FC304C4A3104005E9')

prepare() {
  mkdir -p build
  cd igt-gpu-tools-${pkgver}
}

build() {
  cd build
  meson ../$_pkgname-$pkgver \
    --prefix=/usr \
    --libexecdir=/usr/lib

  ninja
}

check() {
  cd build
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install

  cd ../$_pkgname-$pkgver
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
