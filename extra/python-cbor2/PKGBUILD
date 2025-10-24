# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=cbor2
pkgname=python-cbor2
pkgver=5.7.1
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
sha512sums=('16f873320be5c04f4428e8e42c1088cb0a7ca0f5a8a63b81d235a231a156e75540fec6e5a4fab4df09bae96b3722a9ae3fe542b03204bfb4cf2f67f8d5eeaa3a')
b2sums=('3c314dc421e7ba6c3815bb9c712427bed76388656073d90527e0d2421c5ca67c560ff0cb02a02e9d13fd9ec709e7aff181c70a8cfe753573876efac4209b35b5')

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
