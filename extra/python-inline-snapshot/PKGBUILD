# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-inline-snapshot
_pkgname=${pkgname#python-}
pkgver=0.12.1
pkgrel=1
pkgdesc="Create and update inline snapshots in your python tests"
arch=(any)
url="https://github.com/15r10nk/inline-snapshot"
license=(MIT)
depends=(
  python
  python-asttokens
  python-black
  python-click
  python-dirty-equals
  python-executing
  python-pydantic
  python-pytest
  python-rich
  python-toml
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest-subtests
  python-pytest-xdist
  python-time-machine
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e6d1d5855cfbddb4f99fbdc553153780ee648f8881d6c9187bde5ff2d5bd32b')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest --deselect tests/test_typing.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
