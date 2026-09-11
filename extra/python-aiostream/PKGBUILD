# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-aiostream
_name=${pkgname#python-}
pkgver=0.7.2
pkgrel=1
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
b2sums=('a7b8596c6781a54a915c0f0378a802fc48d051929d6cce1ff604352b504dc1b584070bb0e554cb738afcae380ab727d10c70e7d5f2daa47f6f719a87d708bf76')

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
