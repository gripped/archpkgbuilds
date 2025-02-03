# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Anatol Pomozov
# Contributor: Tim Hütz <tim@huetz.biz>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>

_pkg=mpi4py
pkgname=python-${_pkg}
pkgver=4.0.2
pkgrel=1
pkgdesc="Python bindings for the Message Passing Interface (MPI) standard"
arch=(x86_64)
url="https://github.com/mpi4py/mpi4py"
license=(BSD-3-Clause)
depends=(python openmpi)
makedepends=(
    cython
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('86085436d3ea3587323321b9e661e4df60eabbcf11c2c9cf63d0873ca111cc8b')

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    # This is required starting with OpenMPI 3.0 when trying to run more
    # processes than the number of available cores
    export OMPI_MCA_rmaps_base_oversubscribe=yes

    cd ${_pkg}-${pkgver}
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    local pythonpath="${PWD}"/build/lib.linux-$CARCH-cpython-${python_version/./}
    # run tests via mpiexec according to upstream:
    # https://github.com/mpi4py/mpi4py/blob/3.1.5/.github/workflows/ci.yml#L114-L117
    PYTHONPATH="${pythonpath}" mpiexec -n 1 python test/runtests.py -v
    PYTHONPATH="${pythonpath}" mpiexec -n 2 python test/runtests.py -v -e spawn
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.rst -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
