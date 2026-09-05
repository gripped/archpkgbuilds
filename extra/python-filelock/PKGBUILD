# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.30.3
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
b2sums=('d0b8fafd29ec695314d0b3c90c4269ae6c3b69c87cb250ec718837d9bb37e42c8906ea5aff4e5adf59f65cd0c85c713ade99eac7e2f9d296b2aa833bd7380b83')

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
