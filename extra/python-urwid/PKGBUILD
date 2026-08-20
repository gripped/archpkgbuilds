# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=4.0.11
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
sha512sums=('dcae3c07cd428fe99f754356dea1d4994008ca73436429d5b5158235bcf09e49706de5ee229c0162503aee13d710e04c9d76f19cd6a1a08ef19d061e05419678')
b2sums=('b848998d496a703b4862dbece765f91c68204fb0bbbb4e1b3a38ce8d003b20e6ec3f9f4e55a46bed651ea93ee0d430138deef0d6517e925a266fa5beef32b347')

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
