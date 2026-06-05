# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.9.1
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
sha512sums=('6f1ca79f019e86248c3815b4504465c2dd930e9d8a6261857b9fb45f9ed35f43e7cca229a1892a529ed2490e6f2913397a25e5998e881ecf0c391acfdfe35f48')
b2sums=('107d58c5ad6695437ddfa166c677c13d90152e7790d538d83e65a4ff36ba374f649c3255f75406d576e06f3fb0dc6c318f1afbaaa0f24dbff66a1cc5128868b6')

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
