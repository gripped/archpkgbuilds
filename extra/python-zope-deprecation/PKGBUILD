# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-deprecation
pkgver=5.1
pkgrel=1
pkgdesc="Zope Deprecation Infrastructure"
arch=('any')
url="https://github.com/zopefoundation/zope.deprecation"
license=('ZPL')
depends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.deprecation/archive/$pkgver.tar.gz")
sha512sums=('0fe87e1dcda778d61fdf0b17af10efc9a31070c30f86fa66638964959271a7a59337fe7ca8f81e4678031990de585aa060883351d67a34362f27afa4c8899313')

build() {
  cd "$srcdir"/zope.deprecation-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/zope.deprecation-$pkgver
  nosetests3
}

package() {
  cd zope.deprecation-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
