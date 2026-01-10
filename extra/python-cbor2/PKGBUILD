# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=cbor2
pkgname=python-cbor2
pkgver=5.8.0
pkgrel=2
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
sha512sums=('06de1ad3cf6187776f6e044baa93e267c4fcc55e966a9c062cb3ce94d96016733180443096dc6933f6405ff9867c85280b819737ef4323199b21128536ea1c7b')
b2sums=('5265c1b771414e20d8014c8a1f15c20199c4f8b40ae7f0177b2ab35018a0ea16b15fa840abc3f961ac611c47a21c5255e7dee1524857f624fbb8ca9620bae2f6')

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
