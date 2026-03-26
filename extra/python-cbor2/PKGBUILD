# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cbor2
_name=${pkgname#python-}
pkgver=5.9.0
pkgrel=1
pkgdesc="Pure Python CBOR (de)serializer with extensive tag support"
arch=(x86_64)
url="https://github.com/agronholm/cbor2"
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=($url/archive/refs/tags/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('a83145fdabd3bd13f609a46d92b77256a9a8f97763460e2a8e07da6b1a0ad6123274f5688167df87a27c817b22cf7819c6e7e3bfc00d0f56dc704e3da143f3d2')
b2sums=('5a15afdcd73d422db5f2e8a81907309c4f84a316a1769ee9f815976cb0a9a0730c590c940d7f9f9dc057978f05d2608923e0fddc538c4ff19d6f5efea961365e')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build -wn
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v -c /dev/null tests
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
