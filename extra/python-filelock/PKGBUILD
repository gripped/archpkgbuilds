# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.30.0
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
b2sums=('e786922943d7c09208e978fe8a289e011c61e9ea7c2eef0e43783a4110dbe0d682c5bf68660aaeed9661382815f6cce03d2421931a62422a851a030d81c5c709')

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
