# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=9.1.3
pkgrel=1
pkgdesc='Retry code until it succeeeds'
arch=('any')
license=('Apache-2.0')
url='https://github.com/jd/tenacity'
depends=('python')
optdepends=('python-tornado: for Tornado coroutines support')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-tornado' 'python-trio' 'python-typeguard')
source=("git+https://github.com/jd/tenacity.git#tag=$pkgver")
sha512sums=('8e25aea7c129a33f5144127c0527a13ab140188934930c77fb6a3ba905da664fc13d510b69c87aec23c62715cbabea2776e9cfa4cd72f6d439e0062a50227783')

build() {
  cd tenacity
  python -m build --wheel --no-isolation
}

check() {
  cd tenacity
  pytest
}

package() {
  cd tenacity
  python -m installer --destdir="$pkgdir" dist/*.whl
}
