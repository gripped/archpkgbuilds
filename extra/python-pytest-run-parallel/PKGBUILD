# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.6.0
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
sha512sums=('ac67cc2185071c77006e6adebb2cc204a5c87b7ae9d22af20126af066fefbe5f28a16d978590ba7c9c3e90d582cc99f1bb41fc6fe4d231551ba689e2c7e59a25')
b2sums=('8adacec140953126819bcfb95a11fc69a8aaefc11795194ab5368a80d035d01476faadcb9a19754a5b72ef1d784bf24b96001ee301d2990759b0b883723b5a8b')

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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
