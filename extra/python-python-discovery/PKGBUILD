# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.5.1
pkgrel=1
pkgdesc='Python interpreter discovery'
arch=(any)
url='https://python-discovery.readthedocs.io'
license=(MIT)
depends=(
  python
  python-filelock
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-setuptools
)
source=("$pkgname::git+https://github.com/tox-dev/python-discovery#tag=$pkgver")
sha512sums=('48e56c199308819a09cea4cdef18a944223f6bffad220d6033b11284c3de281e74647e6c4951c12b0da09ddd2227f49438b8c915eea809035f5b5317be79fc92')
b2sums=('9ab7d447bedef9566f5b430202573872d7f1e971f2aab67c912d2bba51f5d0976387cf9a840b51303dc883cb05d8b8ac9af8545dd0062d890342fc89faf5c258')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
