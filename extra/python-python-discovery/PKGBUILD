# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.2.2
pkgrel=1
pkgdesc='Python interpreter discovery'
arch=(any)
url='https://python-discovery.readthedocs.io'
license=(MIT)
depends=(
  python
  python-filelock
  python-platformdirs
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
sha512sums=('6ea3dfdef02ba73585628c23299c0e9f1413b1fd265a6b7e8b3c292e41814feaf7b30422bdccb04b1073c4b1f22c638d5cfbb745f1264c2372923e8f8665107b')
b2sums=('9f9901fd755ace7d80e9cd9956d78241cbd505ef2f2cebe2a4c2c31b9fcb8584fa8d7467a1be174eaac1e4867202a7c7a0300fdf2e1834a90941e6478bd773ca')

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
