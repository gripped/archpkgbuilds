# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=python-zope-event
pkgver=5.1
pkgrel=1
pkgdesc="Provides a simple event system"
arch=(any)
license=('ZPL')
url="https://github.com/zopefoundation/zope.event"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/zopefoundation/zope.event/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0050092b07b2339c9c41e8bb554dd158e41779d77e0ea8345e95db62606440d814aa4ae0567e8010a509fd5c4f89801c79e8192c545df92dd15a6e48b9edd2ce')

build() {
  cd zope.event-$pkgver
  python setup.py build
}

check() {
  cd zope.event-$pkgver
  PYTHONPATH="$PWD/src" python -m zope.testrunner --test-path=src
}

package() {
  cd zope.event-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
