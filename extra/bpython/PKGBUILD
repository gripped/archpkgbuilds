# Maintainer: Kyle Keen < keenerd at gmail >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bpython
pkgver=0.25
pkgrel=1
pkgdesc='Fancy ncurses interface to the Python interpreter'
arch=('any')
url='https://bpython-interpreter.org/'
license=('MIT')
depends=(
    'python-curtsies'
    'python-greenlet'
    'python-pygments'
    'python-pyxdg'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'python-urwid: for bpython-urwid'
    'python-jedi: multiline completion'
    'python-watchdog: module reloading'
)
#source=(https://bpython-interpreter.org/releases/bpython-${pkgver}.tar.gz)  # slow
#source=("https://github.com/bpython/bpython/archive/$pkgver-release.tar.gz")  # missing version data
source=(
    "https://files.pythonhosted.org/packages/source/b/bpython/bpython-$pkgver.tar.gz"
)
sha256sums=('c246fc909ef6dcc26e9d8cb4615b0e6b1613f3543d12269b19ffd0782166c65b')

build() {
  cd bpython-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd bpython-$pkgver
  pytest --deselect bpython/test/test_interpreter.py::TestInterpreter::test_syntaxerror
}

package() {
  cd bpython-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bpython/LICENSE"
}
