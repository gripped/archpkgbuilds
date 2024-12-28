# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=cbor2
pkgname=python-cbor2
pkgver=5.6.5
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
sha512sums=('a8c1267665ef8bd97f0bd622c82b8942d9cb08b82b82c5ad9ba8a498c71bc199f4d8aca209165087684695ed7792fdff41ea6a3eaa1a4d2d8d0824106f79db92')
b2sums=('ecb3c0085c12e77e55a7c6833c7de2d330d48e57dd857770fc6fcfa3ff4f3425c63d4b68d3b36e1a86e0412fd5ded10a45ce6e7d9fa906b74020c14a1dfbbc4d')

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
