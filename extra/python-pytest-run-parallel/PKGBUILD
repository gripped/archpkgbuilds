# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.4.0
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
sha512sums=('c92920620f8b2f16806bbc8ce7f57fd4ff2070424ab3402216439d232a9a91f5d06f0c504952808b2eeb20b73b8d4311e93b6e5ee6caccee0df73836807d99e9')
b2sums=('8216fa0606f8aa52b156685f175c362617c0ace57947b95e221fec4b036b0948a738ee810062a898aa6a3161be469be629559b1042461e97d308e22cbcd8a852')

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
