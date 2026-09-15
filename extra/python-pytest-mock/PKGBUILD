# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-mock
pkgver=3.15.1
pkgrel=1
pkgdesc="Thin-wrapper around the mock package for easier use with py.test"
arch=('any')
license=('MIT')
url="https://github.com/pytest-dev/pytest-mock"
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-pytest-asyncio')
source=("git+$url.git#tag=v$pkgver")
b2sums=('d30c43bedc60955a53ae214a5aaecd2d18e61dbcabc34fe838b35fafd79370b15f633959a2c32c060865108ace6abf2f439a160507d3da93d4bdd2264ded36ce')

prepare() {
  cd ${pkgname#python-}
  # Adapt tests to pytest 9.1
  git cherry-pick -n 1d42981a1577207db5919852f30ef08c97208496
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer -d "$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
