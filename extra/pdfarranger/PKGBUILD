# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.12.1
pkgrel=2
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
sha256sums=('ae9449183a185af9a4ddff9b2eb782653dbeaf3985d85848ed55df4a5bce9f54')

build () {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
