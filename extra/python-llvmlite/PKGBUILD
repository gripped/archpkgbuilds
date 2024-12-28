# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgbase="python-${_name}"
pkgname=("${pkgbase}")
pkgver=0.44.0rc1
pkgrel=1
pkgdesc='A Lightweight LLVM Python Binding for Writing JIT Compilers'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'llvm15-libs' 'python')
makedepends=('cmake' 'git' 'llvm15' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
url="https://github.com/numba/${_name}"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ff2b3fb2aa21e92c328da53fc8db52c89746ee8b2e550ca5facec5ef51340757')
b2sums=('84f6fff1e2161c27c20fff59e5e96f55f4032de1d14d3f330d696f19e4159b18b36feb9b59084a3b7d3a6a6ccbba275e9e3d5343cf4c84fa74ad7c8afe737437')

build() {
    cd "${_name}-$pkgver"
    export PATH="/usr/lib/llvm15/bin:$PATH"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-$pkgver"
    pytest -vv $_name/tests
}

package() {
    cd "${_name}-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
