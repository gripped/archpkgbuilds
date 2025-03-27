# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.3.1
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
sha512sums=('a0ff79a7f5e8b83b463ce9528ee35a413735f65cfa16e4ce38a2c9262b911fe43a168393e1a8a643900af8b84da4ea72a05bb87b1a9f00dcc85b26729ad62e33')
b2sums=('156bec5c1d8a5255fec1cfedf551a9baa763abb26eb34286d3fecd11904d26b3d62fcdba73c8cbe1728f2df80212b2d4f4b3c6b79434967b714859fc3a16c2c2')

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
