# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=python3-xapp
pkgname=python-xapp
pkgver=3.0.0
pkgrel=1
pkgdesc="Python Xapp Library"
arch=('any')
url="https://github.com/linuxmint/${_pkgname}"
license=('LGPL')
depends=(python python-psutil)
makedepends=(git meson)
source=(git+${url}#tag=$pkgver)
sha512sums=('f19fd5bd1a1e9da656dc712fa8e34fa58438b6d9a872e74a2128aa572ab2b89720af996d524fbe9c02cdd89d1d61eeffc9d0fd8f00849555e27769e6bce75454')

build(){
  meson setup build ${_pkgname} \
    --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="${pkgdir}"

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}
