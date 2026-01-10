# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=2.0.1
pkgrel=2
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
sha512sums=('5995838fb2f3a42da2c17bcd784d1bb8e82d4d904aa5c067f7b667bdd73c7213743c69e05feb22758befd750715d4124e6fe4ea13495df593d2232fcc1623b67')
b2sums=('5ce7e2acafb2f20ad5c2792f5cb90187b904f3ed74a6cdead743460461f64a9d8742677dacc6276efae6c0d19e01770b3dc6acff530b3cc02531d49ae61d59bd')

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
