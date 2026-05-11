# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=4.0.0
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('67f8b124ec59f6836edb0dbd85b7a049f87a4dd59c54774e96e4eb26552c14edcb8c410bd39a2fd3f292159d6ef13015d426818b9fd05e816b245769aa0c279d')

prepare() {
  cd marshmallow
  sed -i 's/"flit_core<4"/"flit_core"/' pyproject.toml
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
