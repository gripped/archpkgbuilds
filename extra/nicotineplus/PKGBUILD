# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=nicotine+
pkgver=3.3.10
pkgrel=2
pkgdesc='Soulseek music-sharing client, written in python'
arch=(any)
url='https://github.com/Nicotine-Plus/nicotine-plus'
license=(GPL-3.0-only)
depends=(gdk-pixbuf2
         glib2
         gtk4
         gobject-introspection-runtime
         pango
         python
         python-gobject)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/Nicotine-Plus/nicotine-plus#tag=$pkgver)
sha256sums=('07d1544e1360d4c2d1b13e1c747525547ba1e8a39e697c8a4154dd87a17fdc8b')

build() {
  cd nicotine-plus
  
  python -m build --wheel --no-isolation
}

package() {
  cd nicotine-plus

  python -m installer --destdir="$pkgdir" dist/*.whl
}
