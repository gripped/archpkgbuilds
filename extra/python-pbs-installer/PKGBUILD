# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2024.10.10
pkgrel=1
pkgdesc="Installer for Python Build Standalone"
arch=(any)
url="https://github.com/frostming/pbs-installer"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
optdepends=(
  'python-httpx: for download support'
  'python-zstandard: for zstd installation support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('280c78f3e009aed0475ab3d1f663377bf43ef8438df30cecb9ad0e53c7a3748e0f967f6db02cb9f788c05096f4832ad3f7f1a4fb44f70820fcd1cb09e60ebdaf')
b2sums=('6d610c4d960e5c34bcf0a6aac991077f246831503accedb76f266af79978b1d2f5697951470b86aa02281d70e76960b12785294241ea2e6a8492115a8cc89032')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
