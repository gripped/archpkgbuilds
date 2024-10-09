# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2024.10.08
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
sha512sums=('9beee4258725c98c559de74029911f48c90d3163c29d6e5220f75a6bafee2175e2dd9603f821fed168ad654f1704fe83e01074d22dfc2e222655dc7f7b72172b')
b2sums=('447d00cca6738cc7209306870ac137feb806079169c3dd9633a1e8e126df43ef9781810c9ceb27b5ac2562a1c03a55de55d6f8cbc08362e4ff541036da9020c2')

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
