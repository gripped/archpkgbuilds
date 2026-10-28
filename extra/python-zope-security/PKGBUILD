# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-security
_pkgname=zope.security
pkgver=8.5
pkgrel=1
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
  'git'
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
source=("git+$url.git#tag=$pkgver")
sha512sums=('a2525ff6194649c9fbe13c1b74c9f02bc7d71f4ae1dc2ef866680f3aa42a97e8fa8c5103707f1de5e98c920ef0c4d1a7946068f225e5266886ee942cc61c09c5')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
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
