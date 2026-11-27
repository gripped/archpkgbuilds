# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-location
_pkgname=zope.location
pkgver=6.1
pkgrel=1
pkgdesc="Special objects that have a structural location"
arch=('any')
url="https://github.com/zopefoundation/zope.location"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-interface'
  'python-zope-proxy'
  'python-zope-schema'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-component'
  'python-zope-configuration'
  'python-zope-copy'
  'python-zope-testrunner'
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('46cceb58b8c0c76225497ee90c9abb8e088a51c2e9c1e37516fb8ed49b14f4452343f5e5c5652203d179052fe2f5378d44877e804a7d247ef41b256590256caf')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
