# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.12.0
pkgrel=1
pkgdesc='Helps merge or split PDF documents and rotate, crop and rearrange pages'
arch=(any)
url='https://github.com/pdfarranger/pdfarranger'
license=(GPL-3.0-or-later)
depends=(ghostscript
         glib2
         gtk3
         pango
         poppler-glib
         python
         python-cairo
         python-dateutil
         python-gobject
         python-packaging
         python-pikepdf)
optdepends=('img2pdf: support for image files')
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/pdfarranger/pdfarranger#tag=$pkgver)
sha256sums=('a3ce56078fb428ce7b702d6838a4f9868a47286288fd279e4a1eba5e0ce22874')

build () {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
