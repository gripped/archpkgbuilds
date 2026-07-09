# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Originally by: Denis Smirnov <detanator@gmail.com>

_pkgname=igt-gpu-tools
pkgname=intel-gpu-tools
pkgver=2.5
pkgrel=1
pkgdesc="Tools for development and testing of the Intel DRM driver"
arch=(x86_64)
license=(MIT)
url='https://gitlab.freedesktop.org/drm/igt-gpu-tools'
depends=(libdrm libpciaccess cairo python xorg-xrandr pciutils libprocps kmod libxv libunwind peg systemd)
makedepends=(python-docutils swig xorg-util-macros xorgproto meson)
optdepends=('python-dissect.cstruct: for intel-gfx-fw-info')
source=(https://xorg.freedesktop.org/releases/individual/app/${_pkgname}-$pkgver.tar.xz{,.sig})
sha512sums=('0da8f56a76bb79186da95545be63b8fa82c93edfe9b5fe6ffe43017deb792601545bba292c516b525e1e29087e9b048751df4875d8a7a64e265bac943bf6be81'
            'SKIP')
validpgpkeys=('775965B85650195ACE77E18D7370055DB74C2475'
              'E1996E8A119F43C4BA2BE889D8C620766EA3F69D'
	      '4CF7FC248DC2CE8F34BBE48FC304C4A3104005E9')

prepare() {
  mkdir -p build
  cd igt-gpu-tools-${pkgver}
  # Make man pages reproducible
  sed -i 's/gzip/gzip -n/' man/rst2man.sh
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
