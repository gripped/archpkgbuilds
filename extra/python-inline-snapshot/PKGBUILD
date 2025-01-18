# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-inline-snapshot
_pkgname=${pkgname#python-}
pkgver=0.19.3
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
  python-executing
  python-pytest
  python-rich
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-dirty-equals
  python-hypothesis
  python-pydantic
  python-pytest-freezer
  python-pytest-mock
  python-pytest-subtests
  python-pytest-xdist
  python-time-machine
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86a9a2e4316682f4456d3314b817e5e824240936d0f76e070aad5d4754c0555d')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest \
    --deselect tests/test_formating.py::test_format_command_fail \
    --deselect tests/test_typing.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
