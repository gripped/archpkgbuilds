# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2025.07.02
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
sha512sums=('d03ec1f0ec446ce1d7d27566141ac4575cce803f2372be9eb6da61963e4f7f2a07ee88a544ca6362d0f6599f510841d7a36d3faa75fbb0a61c7486bfe3a71b61')
b2sums=('c92e28fbf2b28c6cb11803a898a3b18225cc8d2a5ff7ddf21b0e51fe1301ad46a0694e1cf4cccb0fc7234637aaacb6e1c19f0915f977565d2a46c7b08b695f16')

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
