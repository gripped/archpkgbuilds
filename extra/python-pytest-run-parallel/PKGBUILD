# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-run-parallel
pkgname=python-pytest-run-parallel
pkgver=0.8.1
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
sha512sums=('1efb314a01c5b49de1bbbeacb7b816c5a6881a5754643706e7dcf26c50364deb0d308ea1cdea7f1dbaf1456a4dbe3658130a37a1d2b272fa71bef783a844ac25')
b2sums=('9c80260990cbcdee030275250869954f3d7b87b24575adc79100ed65dc5d75bcb6bfa52600389119836933ae7a0d8e7575b89e634e6e29e7afc1b00da6cee712')

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
