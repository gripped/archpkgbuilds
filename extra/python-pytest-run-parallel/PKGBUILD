# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.4.3
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
sha512sums=('07d2d2fd4141244bb9dad2957b0c4e68632e8c69cccd533b48c89539688ab618531f45fa754a0bc88d5ccbf6dffe7a882384aac352a2629e98af2316ca2dad2a')
b2sums=('842b02eb9b659999698a1749277254f58803ad0f460940e53be6764c70688800b1a78a058f313d94935cbd82bf5a6ea89c7d2de4eb6f350d7586db0b27682ce5')

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
