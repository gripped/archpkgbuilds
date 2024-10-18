# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs.parse
pkgname=python-calmjs.parse
pkgver=1.3.2
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
sha512sums=('ba9f07ca40efa773a05bcdb2ba0d76eb8bb381eba8667853440f14d28ba1d3cf82774b1ef8bf92b3cd6638278406727c46289b3a69509271c2eba12245050bde')
b2sums=('7ba3265d74b15085f2724fc9ce39ef4cfa101db8b28da07f458ba3b1c2baffa3ef11bada07857b954e305aec3971f3a9b0eaab66ab1d3a2178ec0f150e993deb')

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
