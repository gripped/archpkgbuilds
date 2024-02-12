# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-proxy
pkgver=5.2
_commit=8307de41648dd661708a2e4ad77be310822a1d82
pkgrel=1
pkgdesc="Generic Transparent Proxies"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.proxy"
license=('ZPL')
depends=('python-setuptools' 'python-zope-interface')
makedepends=('git')
checkdepends=('python-zope-security' 'python-zope-testrunner')
source=("git+https://github.com/zopefoundation/zope.proxy.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd zope.proxy
  python setup.py build
}

check() {
  cd zope.proxy
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311:$PYTHONPATH" python -m zope.testrunner --test-path=src
}

package() {
  cd zope.proxy
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
