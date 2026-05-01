# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=3.26.0
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('35a3aae8594a3ab20358a2ab6d0d0f9a0381701e13f1223c67b76421244c6a70f0bf2d2c6f683807882ce4f1579dab2be9773b6a7e06de3be8543524acdb92d2')

prepare() {
  cd marshmallow
  # Handle Python 3.14's changed datetime overflow error message in tests.
  sed -i 's/match="out of range"/match=r"out of range|year must be in 1\\.\\.9999"/' tests/test_utils.py
}

build() {
  cd marshmallow
  python -m build --wheel --no-isolation
}

check() {
  cd marshmallow
  python -m venv --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd marshmallow
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
