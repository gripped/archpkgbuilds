# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cbor2
_name=${pkgname#python-}
pkgver=6.1.4
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
sha512sums=('bf54c31c3d7942b56e99cfc54903df508e3ded8360dd4d432a24532978866b8ca00b21013cd909b98454fb0a3c4c8ea493b56109fc5a5781bd9df7454499bea5')
b2sums=('a375a9db2d4ffcb01d1eb6dae0cce36fcac943d7fcec0f5a62049ea97c1814b1b151fbc7533b06c6bdb5ab37a9308cf3b0ef44a3961a22de2d3cdeea83eafdba')

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
