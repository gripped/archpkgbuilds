# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.20.2
pkgrel=1
pkgdesc="A platform independent file lock"
url="https://github.com/benediktschmitt/py-filelock"
license=('Unlicense')
arch=('any')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
  'python-pytest-timeout'
  'python-virtualenv'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('99165d59448c1f5c8edbd8d0ee9d876558d35dc94ab64c01f3e6844bf0a04f18a9cde1d030e037089ba32aa2ca59258026f26a3f25438ce2e5ffa608e3324e1a')

build() {
  cd py-filelock
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd py-filelock
  PYTHONPATH=src pytest tests
}

package() {
  cd py-filelock
  python -m installer --destdir="$pkgdir" dist/*.whl
}
