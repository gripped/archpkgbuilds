# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=pyvex
pkgname=python-${_pyname}
pkgver=9.2.197
pkgrel=1
pkgdesc="Python bindings for Valgrind's VEX IR"
url='https://github.com/angr/pyvex'
license=('BSD-2-Clause AND GPL-2.0-only')
arch=(x86_64)
depends=(
  glibc
  python
  python-bitstring
  python-cffi
)
makedepends=(
  git
  python-build
  python-installer
  python-scikit-build-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-xdist
)
source=("git+${url}.git#commit=v${pkgver}"
        git+https://github.com/angr/vex.git)
sha512sums=('3ab2e6da31f0a6bbf09f0b2cc8ce752ddb6993a3f2c06274559b1c7fe033c57368b7071267def991f8b5b852448b5641abbe3cc35272e7e84777e891be9ad92b'
            'SKIP')

prepare() {
  cd ${_pyname}
  git submodule init
  git config submodule."vex".url "${srcdir}/vex"
  git -c protocol.file.allow=always submodule update --recursive

  sed 's/-shared/$(LDFLAGS) -shared/' -i "${srcdir}"/vex/Makefile-gcc
}

build() {
  cd ${_pyname}
  export EXTRA_CFLAGS="${CFLAGS} ${CPPFLAGS}"
  # Workaround for parallelism race condition
  # https://gitlab.archlinux.org/archlinux/packaging/packages/python-pyvex/-/merge_requests/1#note_397135
  export CMAKE_BUILD_PARALLEL_LEVEL=1
  python -m build --wheel --no-isolation -C install.strip=false -C cmake.build-type=None
}

check() {
  cd ${_pyname}
  python -m venv --system-site-packages .venv
  .venv/bin/python -m pytest tests
}

package() {
  cd ${_pyname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
