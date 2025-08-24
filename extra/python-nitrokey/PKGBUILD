# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-nitrokey
_name="${pkgname#python-}-sdk-py"
pkgver=0.4.1
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
sha512sums=('af88c7b4a59f11a5d54496c2f2cd3e808d711935b87b0fe21de62a34159f000dacf63f4a8b46be37dd6ba540c3a04d41328bf09e81f02dc2634de05e16c4d498')
b2sums=('e095673defa106072a05286a0144b8a02b581fc3836b783960ebda3c47770eeaf0761ac76111b7368d6f739e42c45191de92f652162a2b76c4b25bd6dfab7cbb')

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
