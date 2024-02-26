# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=3.20.2
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python-packaging')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-simplejson' 'python-pytz' 'python-dateutil')
source=("https://pypi.io/packages/source/m/marshmallow/marshmallow-$pkgver.tar.gz")
sha512sums=('fb2511929408fa6d6cec8f08019d303026a4f777154e16b8fd9037fd338bb8a90d2fd3f41afb3bc565196a612005c4a113d930527b164a7fa2c0e57cf547c339')

build() {
  cd "$srcdir"/marshmallow-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/marshmallow-$pkgver
  PYTHONPATH=src pytest
}

package() {
  cd marshmallow-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
