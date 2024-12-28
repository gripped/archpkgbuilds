# Maintainer: Kyle Keen < keenerd at gmail >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bpython
pkgver=0.24
pkgrel=6
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
    "bpython-python-3.13-fix-tests.patch::https://github.com/bpython/bpython/commit/45f4117b534d6827279f7b9e633f3cabe0fb37e6.patch"
)
sha256sums=('98736ffd7a8c48fd2bfb53d898a475f4241bde0b672125706af04d9d08fd3dbd'
            'd9784f4b4d30504124491ddf62eedae4ad3bc789b6a8d2aeadc905f9d97bee57')

prepare() {
  patch -Np1 -d bpython-$pkgver -i ../bpython-python-3.13-fix-tests.patch
}

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
