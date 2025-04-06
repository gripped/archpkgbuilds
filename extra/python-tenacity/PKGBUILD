# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=9.1.0
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
sha512sums=('88c231057a29d97be4f0563d4961840fda5c1b5faed1f3768409d3c935571a9ffc13ef303a8579ec1fb808cca3339f99b2c49c9ad07f744676cceaa3503ec10b')

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
