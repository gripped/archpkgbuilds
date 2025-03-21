# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.8.0
pkgrel=1
pkgdesc='Plugin for Poetry to enable dynamic versioning based on VCS tags'
arch=('any')
url='https://github.com/mtkennerly/poetry-dynamic-versioning'
license=('MIT')
depends=(
  'python'
  'python-dunamai'
  'python-tomlkit'
  'python-jinja'
  'python-poetry'
  'python-cleo'
  'python-poetry-core'
  'python-packaging'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1d8b89bb5257971c9b0947583c1ed573dd34c0ba5f6d521e7c8c63c64f519dcdf0755e8552797a3acbb1df7baa1122344f976b9763c93dfc49aa96f182993ae4')
b2sums=('192f43cefc8088311a2795b42cb84ef5b5cdecad039955c689d3a97bdb291001f8267ca2a0358facc34c9290758df424742cb5e33dab4ce778754f6ae52ec40e')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# poetry-related stuff is just icky
#check() {
#  cd "$pkgname"
#
#  # integration tests are sketchy
#  pytest -v tests/test_unit.py
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
