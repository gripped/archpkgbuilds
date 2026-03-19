# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.25.2
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
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
  'python-pytest-timeout'
  'python-virtualenv'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('62faa7fad4aeb2ae6aab477e0c63bbd5fc6196f6f466b21bbec18bb7ae3af2cc0ebe3eb0a3b22118cf5084e58c1908c2af13f9f066567340723f7cbf4a182a04')

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
