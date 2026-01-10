# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: minus <minus@mnus.de>

_pkgname=gevent-websocket
pkgname=python-${_pkgname}
pkgver=0.10.1
pkgrel=12
pkgdesc='WebSocket library for the gevent networking library'
url='https://www.gitlab.com/noppo/gevent-websocket'
arch=('any')
license=('Apache')
depends=('python' 'python-gevent' 'gunicorn' 'python-ujson')
makedepends=('cython' 'python-setuptools' 'python-sphinx')
source=(https://gitlab.com/noppo/gevent-websocket/-/archive/${pkgver}/gevent-websocket-${pkgver}.tar.gz
        docs-2to3.patch)
sha512sums=('33473bd20bf8bdab95784bc46093c4f3567d61290731e1980de3b8bf96d71976dca658547320329d5ee5291f54e423a1c7ae8300358bc641eae3c71a1943ea84'
            '0c2c373c0edbbfb0384a2601c32d799c42549c6f0d4f0207a0d68347039af08212c574485d0db31591b90e19aa06d74ddca0bc35f97536cd84ff5a9622a7a588')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/docs-2to3.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/gevent-websocket.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
