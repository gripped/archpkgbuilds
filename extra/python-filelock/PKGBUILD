# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.32.6
pkgrel=1
pkgdesc="A platform-independent file lock"
arch=('any')
url="https://github.com/tox-dev/filelock"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-coverage'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
  'python-pytest-randomly'
  'python-pytest-timeout'
  'python-virtualenv'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('fcd2bd344062fbb448608c29ebfd51e6bad59811bfe0484a5a12873163da064fbbccea00600cc1fabd55655a2c1007c74a66ce20d81996ef7a1b375efaa95aad')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -W ignore::DeprecationWarning
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
