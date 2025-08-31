# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.6.13
pkgrel=1
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('a9ca7443cc7d24d80035105d5393f683509c07bae3fd81c1ecb8a89f9cb235ce697e82a57ac95f18aadbf5011f2ef46317d3adbd1322f53a5b7af883551a12e0')
b2sums=('342b31a87bb03b40357c84cb2c2e781de49809564caaf50b8c78dad2982e20970121e6805bce6e0c24718f20f5e84280a1cb382ede3853f71bd39de844602640')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
