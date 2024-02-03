# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

_name=urwid
pkgname=python-urwid
pkgver=2.5.1
_commit=58ce51af2551c0d7db5386f3283ea186cf11cfc0
pkgrel=1
pkgdesc='Curses-based user interface library'
url='https://urwid.org/'
arch=('x86_64')
license=('LGPL')
depends=(
  'glibc'
  'python'
  'python-typing-extensions'
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
  'python-pytest'
  'python-pytest-cov'
  'python-twisted'
  'python-tornado'
  'python-trio'
  'python-pyzmq'
  'python-gobject'
)
source=(
  git+https://github.com/$_name/$_name.git#commit=$_commit
)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd $_name
  git describe --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name/tests
  pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
