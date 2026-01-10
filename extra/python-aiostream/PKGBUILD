# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-aiostream
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=3
pkgdesc='Generator-based operators for asynchronous iteration'
arch=(any)
url=https://github.com/vxgmichel/aiostream
license=(GPL-3.0-only)
depends=(python-typing_extensions)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('519b4b70a9876d033be6a6f9050f081875f4c0259a8706d9ba7d5cec5c10ffd0dc9840011b71292240dd019ec34e883fd3268aec2724587d63fe9d9026d92371')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  PYTHONPATH="$PWD/$_name:$PYTHONPATH" pytest --override-ini="addopts=" tests --strict-markers
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
