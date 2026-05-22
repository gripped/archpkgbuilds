# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-socket
pkgver=0.8.0
pkgrel=1
pkgdesc='Pytest plugin to disable socket calls during tests'
arch=(any)
url='https://github.com/miketheman/pytest-socket'
license=(MIT)
depends=(
  python
  python-pytest
)
makedepends=(
  git
  python-build
  python-installer
  python-uv-build
)
checkdepends=(
  python-httpx
  python-pytest-httpbin
  python-requests
  python-starlette
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('a107cb74648d214528464db77c52417a458c444a52513dd81a42d3f1098389a382fe3af788a2f93fc10af8d8b2f41069552e890bd95ae8c84f5e87fccb8b86f4')
b2sums=('c118057de2693f577851f97b5068c96d5db19f6a73c7c43f7411b3e0b0f65a1fb6107a47714e9590f1321f5dc7b0463f2fb4c3d176c13eca6d554f83f4ef60e5')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install as importlib is used
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PYTHONPATH:$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
    --deselect tests/test_socket.py::test_urllib_succeeds_by_default
    --deselect tests/test_socket.py::test_enabled_urllib_succeeds
  )

  pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
