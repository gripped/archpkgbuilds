# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=4.1.5
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
sha512sums=('0e07b2127e274b786be09b13808da5a8e6717f941b92d61af6b0e9436c4f95c82febdfeeec2408e7b40101d2b111d5fe2bce3263e86e5cae1631237f691fee8c')
b2sums=('3e36ada7cb6c56a8257ac3597a5331d485b8b5d9a9d96be3e038fe094bea99b124722c74dc31bef7a8b077968ae5a1c0fcf775b4699cc777dbabe34e784fd384')

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
