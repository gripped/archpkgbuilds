# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=4.9.4
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
sha512sums=('3023a427289ad2ad22e75b4c6a39d419b1ad280d3410948e26eb70ca0353d5e0da5670baad14b52100e5ac0fd6af78242cdee7f4f152315c284a97aa81def210')
b2sums=('ebb0b729b23ab40a35affa3c30afbd513c5272791fbc41046b9638ec7944b46ecaaf5899792113250200652d23b76d033558c394cd2d002ad0a3415b34b3cf89')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/src" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
