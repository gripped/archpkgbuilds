# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blockbuster
pkgver=1.5.27
pkgrel=1
pkgdesc='Utility to detect blocking calls in the async event loop'
arch=(any)
url=https://github.com/cbornet/blockbuster
license=(Apache-2.0)
depends=(
  python
  python-forbiddenfruit
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-benchmark
  python-requests
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('0bca69c722013c53d30a3928eef8e8c062b03fe2d91cd3a134d259337895000e4231f537539da7baae788d7170c0feb1777b422efeea6e1498a1aca23186d43b')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
