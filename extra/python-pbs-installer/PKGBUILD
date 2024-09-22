# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2024.09.09
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
sha512sums=('b935a8e7b9255310f6a3ee7f81a09c56090872375113fa1f9b077b3c7ef6a9a323d5d39c27edeb4806f7d8ff3c89d86977011d4680511365cf20a7c78a2636dc')
b2sums=('e5168ad2c4d9345cbda2ee2f2defe8525cd77abaa910d7e2701ce82ced9ba2fd0f0c5cc6eb21b5f7911ac0c9a4d24477af33736fcbe9af7a3661d4b56a4f46ba')

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
