# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-picklefield
pkgver=3.3.0
pkgrel=1
pkgdesc='A pickled object field for Django'
arch=(any)
url=https://github.com/gintas/django-picklefield
license=(MIT)
depends=(python-django)
makedepends=(
  git
  python-setuptools
)
_tag=4cf20241463097fc11778108b9f13f8e779492bb
source=(git+https://github.com/gintas/django-picklefield.git#tag=${_tag})
sha256sums=('b6b978c5e7efac6fa8fcd1b04cc271254efcfacd029f05c21133ed89e5854536')

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
