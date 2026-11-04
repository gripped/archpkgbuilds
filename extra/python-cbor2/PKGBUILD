# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cbor2
_name=${pkgname#python-}
pkgver=6.2.0.post2
pkgrel=1
pkgdesc="Pure Python CBOR (de)serializer with extensive tag support"
arch=(x86_64)
url="https://github.com/agronholm/cbor2"
license=(MIT)
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=($url/archive/refs/tags/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('dc15e61dc9ee87fc543bac7d0e47c76bbb3e089c9e34b09a15dd5993434cd5b7ba98847c3c3a3316d1aff6381aada9fcc6807bb264fc90b67274ad813395945b')
b2sums=('c646f0f2dc32ca2fe15aecae7e3ba4dae084bb323e4ae5691c22e82348d227adcfbd5d5e93fc641185ddabf71025ae698fe889a2a85487fd785e643a2af14d36')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build -wn
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd $_name-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version:${PYTHONPATH}" pytest -vvv -c /dev/null tests
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
