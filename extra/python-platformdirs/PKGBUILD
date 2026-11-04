# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=4.14.3
pkgrel=1
pkgdesc='A library to determine platform-specific system directories'
arch=(any)
url='https://github.com/tox-dev/platformdirs'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-hatch-fancy-pypi-readme
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-appdirs
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('793a0938f63fc4cd21f2015dba9d633222c429decac81186bf77d8ba3c215c27eb06f5fb9b0109a11312a662de8e71593662dc394b1956b8d9389ed758d54ba8')
b2sums=('0d40c3f1cfbc39ba3048ed8c9203f621f8ca4fef30028f48aae65b19b9abe738d46200d9397f2a20e10a986a98611787362c0d4514b989c659f5aa039c02679b')

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

  local pytest_options=(
    -vv
    --deselect tests/checkers.py
  )
  pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
