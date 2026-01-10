# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-picklefield
pkgver=3.4.0
pkgrel=2
pkgdesc='A pickled object field for Django'
arch=(any)
url=https://github.com/gintas/django-picklefield
license=(MIT)
depends=(python-django)
makedepends=(
  git
  python-setuptools
)
_tag=b8b24bead3ff2a62449e094b56a539232e124b87
source=(git+https://github.com/gintas/django-picklefield.git#tag=${_tag})
sha256sums=('de1871b5b5070675cfd6a95094031f6b4ca4f86f6be6f2dcd1e86426ff587b43')

pkgver() {
  cd django-picklefield

  git describe --tags | sed 's/^v//'
}

build() {
  cd django-picklefield

  python setup.py build
}

package() {
  cd django-picklefield

  python setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-picklefield/
}

# vim: ts=2 sw=2 et:
