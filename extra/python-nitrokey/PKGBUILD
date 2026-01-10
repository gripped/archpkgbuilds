# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-nitrokey
_name="${pkgname#python-}-sdk-py"
pkgver=0.4.2
pkgrel=2
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
sha512sums=('04003651240361e736e4a3a4f3c7f172a86f06eab7a0a6bd862e20fd8b22aa7918e130fd918ee10f906322949bd8ad292b03e0dc708c928c951e236c6650c680')
b2sums=('ee2d08363eb7ccb2e72fb73bd2d45e01c00f3c6784bbd5ea2f5b185a4c358c3502e2200796fdcb0c98cc1037324d4cb7e8b7cca97e3a53d5122049040ad778b6')

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
