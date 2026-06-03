# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cbor2
_name=${pkgname#python-}
pkgver=6.1.2
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
sha512sums=('abbe4d4a1b792df056ac628536795cbc0a23217dac3a52c7449a7447e549d22f5fec00a9643f5b48168df75c12d9d83a0dd01c63ee67f764ca088d29a28954b0')
b2sums=('60f3a223528792a6f18be494e1eba79053a075688c59c5f3355e5f363e0bbf5bc1a56c91984b05e352fa124cb3632b627a9e4e79193491c34ce45313811eaacf')

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
