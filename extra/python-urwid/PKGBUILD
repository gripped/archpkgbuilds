# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

_name=urwid
pkgname=python-urwid
pkgver=2.6.8
pkgrel=1
pkgdesc='Curses-based user interface library'
url='https://urwid.org/'
arch=('x86_64')
license=('LGPL-2.1-only')
depends=(
  'glibc'
  'python'
  'python-typing_extensions'
  'python-wcwidth'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-twisted'
  'python-tornado'
  'python-trio'
  'python-pyzmq'
  'python-gobject'
)
optdepends=(
  'python-gobject: for gobject integration'
  'python-pyserial: for LCD and serial integration'
  'python-exceptiongroup: for trio integration'
  'python-pyzmq: for zmq integration'
  'python-tornado: for tornado integration'
  'python-trio: for trio integration'
  'python-twisted: for twisted integration'
)
source=(
  $_name-$pkgver.tar.gz::https://github.com/urwid/urwid/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('016f65e929451d7801cc85960628f83d1da128217ab4d7fa04cfa55a94a6ca40')
sha512sums=('a5effb19a13c1e0e81b1486aba4c2ad4223cebdfa499d701940cfb12c148a727a1af9454abb41200f7df0456b1ebc56b55b981ed7064387a587749c9fae10bd8')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
