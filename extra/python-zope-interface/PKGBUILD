# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
pkgver=6.2
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 3.x'
depends=('python-setuptools')
checkdepends=('python-zope-event' 'python-zope-testing')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('42c169ba88e0e4fe7895f0956250ddb5f3e9aef3e73a801ef71b0e94f906e9f597008de16955a7a8a5ca59551b800e6f000c70ffb3f486a7cbb7bf9caa00059d')

prepare() {
  cd zope.interface-$pkgver
  sed -i '/coverage/d' setup.py
}

build() {
  cd zope.interface-$pkgver
  python setup.py build
}

check() {
  cd zope.interface-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311" python setup.py test
}

package() {
  cd zope.interface-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
