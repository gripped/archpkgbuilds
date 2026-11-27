# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-nitrokey
_name="${pkgname#python-}-sdk-py"
pkgver=0.5.2
pkgrel=1
pkgdesc="Python SDK for Nitrokey devices"
arch=(any)
url="https://github.com/nitrokey/nitrokey-sdk-py"
license=('Apache-2.0 OR MIT')
depends=(
  python
  python-crcmod
  python-cryptography
  python-fido2
  python-hidapi
  python-protobuf
  python-pyserial
  python-requests
  python-semver
  python-tlv8
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('b556f8d3b0ad21db6cd9d00d2d30c88d4ddc3f054f8bc1741215fb84d3bffa76764117763f24a9ff38da46b5441c5cdfec417c2d04c75eb2d1104bd24cc59230')
b2sums=('c20cf707ac6b1fa3dc4972145424f898c1ecbaaa5ff1b11b4df3f06ccc286be54c4992f70dc29bf1bf6d3585d48bd0ba0c9353dda3514b76dc2d17db422c015b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  PYTHONPATH="src:$PYTHONPATH" python -m unittest discover tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
