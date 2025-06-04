# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=box2d
pkgver=3.1.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games"
url="http://www.box2d.org/"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'git' 'wayland'
             'libxinerama' 'libxkbcommon' 'libxkbcommon-x11' 'libxt'
             'xorg-xrandr' 'libxcursor' 'xorg-xinput' 'glfw')
# We're going to this alternate fork until the patches are upstreamed.
# See https://github.com/erincatto/box2d/issues/621
source=("$pkgname-$pkgver.tar.gz::https://github.com/erincatto/Box2D/archive/v${pkgver}.tar.gz")
sha512sums=('7367640e7f2ff395b8ca48766c71f57c96e08c298627c996eba76899a149ee28b0e3ecacfa4a224fdb5d160c7e25c6069bb8414fd1575787727d796097aa347b')

build() {
  cd $pkgname-$pkgver

  export CXXFLAGS="$CXXFLAGS -Wno-error=unused-result"
  cmake \
    -Bbuild \
    -GNinja \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir" ninja -C build install

  cp -r include "$pkgdir"/usr/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/box2d/LICENSE
}

# vim: sw=2 ts=2 et:
