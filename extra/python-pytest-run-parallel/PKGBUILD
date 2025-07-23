# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple pytest plugin to run tests concurrently"
arch=(any)
url="https://github.com/Quansight-Labs/pytest-run-parallel"
license=(MIT)
depends=(
    python
    python-pytest
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-tox
)
source=("git+https://github.com/Quansight-Labs/pytest-run-parallel.git#tag=v${pkgver}")
sha512sums=('496e7fc153f45cc915a2726ca8671c5c9c9dcb8c3901c38ac9bc12e78d07a56d6cf3244b297c6da66349fabfc0410a7935462cea6b9deeace0cbbc0c5449dfa5')
b2sums=('7530ac8769541369443da19d23ba0af4a61c5ded465b4b3a9bb83242fc41da72c2f59bf10b374e4846bfe5eab4122aa1fa3d14f951f4878299d87425ead4c90d')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

# check() {
#     local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#
#     cd $_name
#     python -m installer --destdir="tmp_install" dist/*.whl
#     export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
#     tox run --skip-pkg-install
# }

package() {
    cd $_name

    python -m installer --destdir="$pkgdir" dist/*.whl
}
