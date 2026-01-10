# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=pyvex
pkgname=python-${_pyname}
pkgver=9.2.160
pkgrel=2
pkgdesc="Python bindings for Valgrind's VEX IR"
url='https://github.com/angr/pyvex'
license=('BSD')
arch=('x86_64')
depends=('python' 'python-archinfo' 'python-bitstring' 'python-cffi' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+${url}.git#commit=v${pkgver}"
        git+https://github.com/angr/vex.git)
sha512sums=('785021aa203a0226ea579dfd96d71f98534c57bd7425b45b45307e6ed9fa029874ad826740575b9587694358821a2b17d6b0cd9e48c1735a4e12bd27efd37f1f'
            'SKIP')

prepare() {
  cd ${_pyname}
  git submodule init
  git config submodule."vex".url "${srcdir}/vex"
  git -c protocol.file.allow=always submodule update --recursive

  sed 's/FLAGS=/FLAGS+=/g' -i pyvex_c/Makefile
  sed 's/-shared/$(LDFLAGS) -shared/' -i "${srcdir}"/vex/Makefile-gcc
}

build() {
  cd ${_pyname}
  export EXTRA_CFLAGS="${CFLAGS} ${CPPFLAGS}"
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}
  # TODO: enable all tests once angr is packaged
  rm tests/test_spotter.py
  PYTHONPATH=build/lib pytest
}

package() {
  cd ${_pyname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
