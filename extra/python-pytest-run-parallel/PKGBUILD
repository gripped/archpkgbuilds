# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.9.0
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
optdepends=(
    'python-psutil: for identifying the number of available cores'
)
checkdepends=(
    python-hypothesis
    python-pytest-order
    python-pytest-xdist
)
source=("git+https://github.com/Quansight-Labs/pytest-run-parallel.git#tag=v${pkgver}")
sha512sums=('4ddf97a3e11ec2ad69ff0c1bbbcb595c5bab66e4a783fd28344c11ae9ac97baaa1f591418172197f8155134556981f42821fbfcb86b433e3c7b3ecd47e543f03')
b2sums=('a41ccce3df7b1b405ad3c3fb1ee020e975cd42c3af3009123e0d975b007b5655dcbd0622c5e762ef5e54e4deed7587e791a776373291d2191db3618cebbcdb56')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    PYTHONPATH="$PWD/src:$PYTHONPATH" pytest -vv
}

package() {
    cd $_name

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
