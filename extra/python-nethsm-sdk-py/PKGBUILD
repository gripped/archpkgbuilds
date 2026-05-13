# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=2.1.1
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
  python-poetry-core
  python-installer
  python-wheel
)
provides=(python-nethsm)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('e8717aae9bf364d6e639f0f257396c2db4a2a7f6fb372618e397d4448daeb6b0caaa7cfb858c860afe0b973b581ad4e8dc9ecc6ea521e3d9e9fb1fa6dc8202ee')
b2sums=('c61774fedbb53bb83f75c90c1f2d346122873aea1e22d6d6d1e74a25e8649603d77a8e0d67a5ec427284425863d5d73029db6627936be903ac3155001411e862')

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
