# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=4.0.7
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
sha512sums=('f744836962468ced955143ad872fa85232ef41aca24e57cd84c44023a7cc1665065caa6ae4671058219d054f97f7240283d6eb0c9695fc08429a3388ce61de6c')
b2sums=('0ff224ad7a10fe4dc432e5bc89f4ed5f5793d13e18ce70377f4b940ae8bbb68ea114949bd35ea52d694762c840d12f34823e5dd5ff7d475e9d695e60c75eb5c3')

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
