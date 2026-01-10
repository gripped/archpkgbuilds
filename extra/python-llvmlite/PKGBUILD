# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgbase="python-${_name}"
pkgname=("${pkgbase}")
pkgver=0.46.0
pkgrel=3
pkgdesc='A Lightweight LLVM Python Binding for Writing JIT Compilers'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'llvm20-libs' 'python')
makedepends=('cmake' 'git' 'llvm20' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
url="https://github.com/numba/${_name}"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('227c9fd6d09dce2783c18b754b7cd9d9b3b3515210c46acc2d3c5badd9870ceb')
b2sums=('cdd0d99ff7003e14a5806b8385040251c1ea0fa67ae64988ff32ba5001be8d4769b2b0b27afc1ae30d5f3b34db20096e01afd2e9e6ee50c6568f142b6071bbf5')

build() {
    cd "${_name}-$pkgver"
    export PATH="/usr/lib/llvm20/bin:$PATH"
    LLVMLITE_SHARED=ON python -m build --wheel --no-isolation
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
