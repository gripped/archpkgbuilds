# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2025.10.10
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
sha512sums=('d8d9403b592b536ca1bc7dc73efe30e9de961e4e9711e6f39afb4c4c6485a26377fd3ec63f22a382ded5ffcef6334b7c8f5ba52a5ef6f229d3c5e82d7488aaf9')
b2sums=('baa508106956df9a5305a15d1e202e2b3fbb9ff82d1e25d0d34798eb233fdfa2a67e2e6777081487ab7a6e5757eb22ba39ddac7a31eaaf83137aef476e5c1166')

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
