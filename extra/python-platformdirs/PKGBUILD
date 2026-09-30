# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=4.12.2
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
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-appdirs
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('e203a44fbd5a23560e80d726cc821703d6f131bf965b71d592bded6c650c413645dbef9c0eafbdd030b3f9dfbb38ca449345f4e7449435ae16b515c268ccf6f3')
b2sums=('2e05214a7d585d7ab7220ded51b902acd9720da4a116dec41caeaae138a34bfb69a23f584297cb2dcf4081125aad6f03c6fa136bd3e8265b4d6542e95abb521e')

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
