# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=4.11.0
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
sha512sums=('3eaa5315e4cdbdc502e367d004f7b63cc4b84ad3a693bc0788173fb18ef93d632d9885fe037810fba320c95a655f94aab046768c7d6baf1fddd5994573fa9974')
b2sums=('10bc77a1511ebf3d2c8c28d547a52d4c4178bbb101dece0d20a3e90a220ee8f96a257e96839417479f305f266547eb423075964d714b3c54693367f0449a48ad')

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
