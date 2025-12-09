# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2025.12.05
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
sha512sums=('1e22256ee784e1edf046290425d59ff7023d4c5896d2ebc070fd651bc2b1f0fc3c1f49a1cfd9b6d6beff6da9f4d5ab698e7b5d21f61183b9d1ecc10c1d28e21b')
b2sums=('3d41a0c4bb7ead4173d9bb815817bc37bbd9951a7127328dd0fad45bc8de2d24d00c701ada33d90137532ba7fd66db901e975a3934dca89255b870ee215bcaa7')

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
