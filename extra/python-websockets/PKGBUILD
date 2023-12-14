# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: user6553591 <Message on Reddit>

pkgname=python-websockets
pkgver=11.0
pkgrel=1
pkgdesc='Python implementation of the WebSocket Protocol (RFC 6455)'
url='https://github.com/aaugustin/websockets'
arch=('x86_64')
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx-copybutton'
             'python-sphinx-furo' 'python-sphinx-inline-tabs'
             'python-sphinxcontrib-spelling' 'python-sphinxcontrib-trio'
             'python-sphinxext-opengraph')
source=(https://github.com/aaugustin/websockets/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('367347464d5d721ad65055743df92311e7d98d0391ff437ab8c3224f1c1e4193b5abbdbf1498cd040d9b30251e6bc051e9c1ec54122b87e4c937026e0f6f3b8e')
b2sums=('b40b8e88375a1e5e0f6ae1c73169703d206800dcec15d858a0360374701b681ec17c457b014a29dc34962ca1f62261a8b8298e34092429864d790dd4a060e8d8')

build() {
  cd websockets-${pkgver}
  python setup.py build
  sphinx-build -b dirhtml docs docs/_build/html
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd websockets-${pkgver}
  PYTHONPATH="$PWD/src" python -m unittest discover -v
}

package() {
  cd websockets-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -rT docs/_build/html "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/websockets.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
