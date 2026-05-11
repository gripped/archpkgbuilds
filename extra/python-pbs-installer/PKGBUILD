# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2026.05.08
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
sha512sums=('e078db0935e04cfe110530dac71fafd179ff9ffcade8acb64a52e56a4da7d8d5116a3af2041291f8e901ae3e8a375b004b7e733d85ef5f1d0e59ca14bb805917')
b2sums=('cebd457bb5c77531b967865b15d8c523a9df56f8d4885fab134cd933e464946d19f45bde3486049bd5d91e54c06a86aa6be8f73cb1e45826c667bf16b638f213')

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
