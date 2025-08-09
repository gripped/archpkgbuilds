# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
_name="${pkgname#python-}"
pkgver=4.3.8
pkgrel=1
pkgdesc='A library to determine platform-specific system directories'
arch=('any')
url='https://github.com/tox-dev/platformdirs'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
  'python-appdirs'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('b353217c92335f249bc7b1dab6ad356a8cba4a137a32f4541dd9faa72d1bbabb7e9d9b371b861e5e242f099597eb9e4364604187fd6629c4a51aa337f824c4ba')
b2sums=('e2265c6f4d699d00023ab765d863dc64485b928d0539d2391c844c6a9d6dd4d82ac696e4283b25310cee944b03132ba3d97245071d50a679b4bb348722d725b4')

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
