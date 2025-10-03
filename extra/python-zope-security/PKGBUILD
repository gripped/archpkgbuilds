# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-security
_pkgname=zope.security
pkgver=8.1
pkgrel=2
pkgdesc="Zope Security Framework"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.security"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-component'
  'python-zope-i18nmessageid'
  'python-zope-interface'
  'python-zope-location'
  'python-zope-proxy'
  'python-zope-schema'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-btrees'
  'python-zope-configuration'
  'python-zope-testing'
  'python-zope-testrunner'
)
optdepends=('python-zope-configuration: for ZCML support')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4cccaf50c44a7c1345e3372c8b9f770e51e4920f12a06a9fc8243b887d53e65247329ce1cb8f0eed0d386e86f4bc7f6b9d5a2087c17247a4476d685766be6879')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
