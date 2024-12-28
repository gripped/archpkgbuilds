# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs.parse
pkgname=python-calmjs.parse
pkgver=1.3.2
pkgrel=2
pkgdesc="Various parsers for ECMA standards"
arch=(any)
url="https://github.com/calmjs/calmjs.parse"
license=(MIT)
depends=(
  python
  python-ply
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('bf966cda0b4f70427d787077375615a932d474d3075fa9952dafe14768863420affca15ce75a6da607dddf76e7317240bd0ec1a92228644312c1e0c4c54a82ed')
b2sums=('3bd6a3507b7b812775fb12ad8329cb6898f9b3529490b0733e31a685e6099e3fd29326c4fd01b7a086c1853dc9b50b9305ce94f2328f7d0e332483b94d8359ce')

prepare() {
  cd $_name-$pkgver
  # generate symbol tables required for lex and yacc
  # NOTE: this may require a specific python-ply version!
  PYTHONPATH="src:$PYTHONPATH" python -m calmjs.parse.parsers.optimize
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD/src:$PYTHONPATH"
  PYTHONDONTWRITEBYTECODE=1 pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
