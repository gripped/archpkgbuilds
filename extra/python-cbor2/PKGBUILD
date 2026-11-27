# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cbor2
_name=${pkgname#python-}
pkgver=6.3.0
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
sha512sums=('9a4476148d471eba05144dd7b1f0994a9b7df750ec0f78cfe42377b7dfc3047e2913b6212f64d4af67a6df915c575b87f4541cf81b389bd486a93aa576cf6420')
b2sums=('d35692147708a0666bc7291618e46b722da5ce20ea13e26756c846b6dec165b13e9065675f7b7bdcb6c37f345a39db20e40a483d45531736d1cdf913477dca73')

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
