# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-greenlet
pkgver=3.4.0
pkgrel=1
pkgdesc="Lightweight in-process concurrent programming"
license=("MIT")
arch=('x86_64')
url="https://pypi.org/project/greenlet/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-objgraph' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-${pkgver}.tar.gz")
sha512sums=('b5d1499870552b9de89074bf5ac2b900c2a59319f9514073c346a08e69160b3c9b39b6b9a577ecd7c4fddd70c6cba1f9d891b2862027890fa5421aefe16686ba')

build() {
    cd greenlet-$pkgver
    # see https://github.com/python-greenlet/greenlet/issues/454
    export CFLAGS="$CFLAGS -fcf-protection=none"
    export CXXFLAGS="$CXXFLAGS -fcf-protection=none"
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd greenlet-$pkgver
    local _python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    echo PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" python -m unittest discover -v greenlet.tests
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" python -m unittest discover -v greenlet.tests
}

package() {
    cd greenlet-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/greenlet/tests
    install -Dm644 LICENSE.PSF -t "$pkgdir"/usr/share/licenses/$pkgname/
}
