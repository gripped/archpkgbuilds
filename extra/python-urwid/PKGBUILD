# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=4.1.3
pkgrel=1
pkgdesc='Curses-based user interface library'
arch=('any')
url='https://urwid.org/'
license=('LGPL-2.1-only')
depends=(
  'glib2'
  'python'
  'python-typing_extensions'
  'python-wcwidth'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-gobject'
  'python-pytest'
  'python-pyzmq'
  'python-tornado'
  'python-trio'
  'python-twisted'
)
optdepends=(
  'python-gobject: for gobject integration'
  'python-pyserial: for LCD and serial integration'
  'python-pyzmq: for zmq integration'
  'python-tornado: for tornado integration'
  'python-trio: for trio integration'
  'python-twisted: for twisted integration'
)
source=("git+https://github.com/urwid/urwid.git#tag=$pkgver")
sha512sums=('9f9319cff12565c35e1f1686b042095d6c9c15e9160f7970f6040ddb2297ff7de1a3fabcf2e39bc4ee7ff20e3064dcf0d7e84286313272af2e966b32eec05038')
b2sums=('612c1f7c382cc1d81d403a80139b30296a749b101fbcc8045a260c45669bf82d533ced3889d11b13a75c6c5cd4571328550bd3d942b18d1516db698f79c9e266')

build() {
  cd ${pkgname#python-}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts=-vv --doctest-modules -s" tests
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
