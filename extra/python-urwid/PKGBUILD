# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=4.0.2
pkgrel=1
pkgdesc='Curses-based user interface library'
arch=('any')
url='https://urwid.org/'
license=('LGPL-2.1-only')
depends=(
  'glib2'
  'python'
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
sha512sums=('ff9fa3ae89117696664bb7ae19c4b5a53463f7482d65ed60c2dbe5b44ca096596de5d409d69d5f05a8bb0d2f3143e4471f0e002b72b3bc7a16d871f10fb9684d')
b2sums=('5a7167163396e583efcd9248cd8b446afe6f52c5c75b02637be01105cbe505a70638d9678b804753b64db2e01e972e5ed338dec06ac1b97fe67a46edd1021cb6')

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
