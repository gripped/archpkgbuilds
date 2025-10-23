# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=2.0.0
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
sha512sums=('9d0c0d66e69daecb6dc994f5594eb70139152cdb22336ea285e2a8555fbce88cb9820b0e0ba366a7236ea7a0d9d7d17e268d8c929fef61d0998446d99715f606')
b2sums=('9c178b2e74b9e46b8534894a1d019f0896b66ab1a51edbc2ba13fbd8b0ac00465af3ae81c11754dec0f860e24f35454297fd0a272f9303a3da3daa1cef6a81b0')

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
