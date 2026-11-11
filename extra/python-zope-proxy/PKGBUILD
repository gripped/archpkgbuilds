# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-proxy
_pkgname=zope.proxy
pkgver=7.4
pkgrel=1
pkgdesc="Generic Transparent Proxies"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.proxy"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-interface'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-security'
  'python-zope-testrunner'
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('2383aa089d07ad08fdb81acf47fdc30b6aeca68df12d354b3ae31259876023dc94facfa42dfb3deebb8375bf072ae9e56a1f6cbbc91e130000cf787ee9194d30')

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
