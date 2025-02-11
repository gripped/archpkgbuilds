# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs.parse
pkgname=python-calmjs.parse
pkgver=1.3.3
pkgrel=1
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
sha512sums=('3259d108fd3e28549a7fc5070ed3cc429ea9dd0412e576e98922c16387a0e50e15c27c3651e3f6275878fc0a271523dd7431afe34fd383c497438621f1bfd206')
b2sums=('92434a7dd59a910b88b838b857a60de38cacbda61ecbd4f574e6951de2272f497e9c8c7f0ff3b01cfa59187036b75085b231293497126899fa466658ff3dcbd6')

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
