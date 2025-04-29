# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=1.4.0
pkgrel=1
pkgdesc="Client-side Python SDK for NetHSM"
arch=(any)
url="https://github.com/Nitrokey/nethsm-sdk-py"
license=(Apache-2.0)
depends=(
  python
  python-certifi
  python-cryptography
  python-dateutil
  python-typing_extensions
  python-urllib3
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
provides=(python-nethsm)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('a6f01cf970081815107b9bc9d8b5c650ba2d54123e449b9120ca7a5a1de32cac0dad8a2de4f41c5c745840fc71f969039bcf65d0e21decb8bb3d2ec60402cbb1')
b2sums=('222aea18eaad292d1b65b2cb433257d39f89949c25891c8d115495fc6dfea12e18af4d63672361de67e912e0009ef4e844cf46917387ffecd23ee69d48294fbd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: all tests are disabled, because they require docker

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
