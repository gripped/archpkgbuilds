# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-greenlet
pkgver=3.2.1
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
sha512sums=('75fd697d0bde99c60d4c741c61c1010e2bae659e93661e8ea37f6683c1223422a7f862aa770b80bc3299593a9791ec515fd31797fd36216ed784f4e2f4103420')

build() {
    cd greenlet-$pkgver
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
