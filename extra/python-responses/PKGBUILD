# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-responses
pkgver=0.26.1
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library'
arch=(any)
url='https://github.com/getsentry/responses'
license=(Apache-2.0)
depends=(
  python
  python-requests
  python-urllib3
  python-yaml
)
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
  python-pytest-httpserver
  python-tomli-w
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('c7651100288da048ada84ff2cf25c31c1f12ab60d635342af04f97c30653c968a097685dde754589e499727a7c46ea4939514eff81d560da116fcc624f63169c')
b2sums=('1297bf7dde7bbfbcd860523878ead2abbef9746c0cb605a7b82141e2c540e49b1359a7959c431f18e4afea404bd4ad1703c20d403f5bdf29d3fcca63867d3266')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
