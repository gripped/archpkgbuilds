# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-nitrokey
_name="${pkgname#python-}-sdk-py"
pkgver=0.2.4
pkgrel=1
pkgdesc="Python SDK for Nitrokey devices"
arch=(any)
url="https://github.com/nitrokey/nitrokey-sdk-py"
license=('Apache-2.0 OR MIT')
depends=(
  python
  python-crcmod
  python-cryptography
  python-ecdsa
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
sha512sums=('b66dac46c6fc400a4d3bff0d2aa45bcda364d092797b70c1e273413600080e4dbb74634d0bf3886fe9717c2b1419ac9e5b8852147c9fa29c64eb826f37bfde7e')
b2sums=('3284bd8bd52d075445e544099d70080e25c429485fc0e0a3ce7adc7ea4dfadc2de74422720cdc59939818eedbd4336f05ea398c49216daf465b4474856e9629e')

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
