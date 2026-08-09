# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=4.11.1
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
sha512sums=('e30fccf0be4a96cae61ceb89eb37ebedf6db7f878bb14ecd44cce6a793e3fdf7e4dc3892c49a3f1b7841c4db2f08b13b4001ba6203b9092c5220793b764255f1')
b2sums=('4c5c366c7c7994845dea7ce2f44b6a72325730d233aefd51c313d24fa68264df363361c41e65fd4370e25ca0437fd1db032eb22644eb50a1fbf7906fe467f64a')

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
