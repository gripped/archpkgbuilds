# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgbase="python-${_name}"
pkgname=("${pkgbase}")
pkgver=0.44.0
pkgrel=1
pkgdesc='A Lightweight LLVM Python Binding for Writing JIT Compilers'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'llvm15-libs' 'python')
makedepends=('cmake' 'git' 'llvm15' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
url="https://github.com/numba/${_name}"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('07667d66a5d150abed9157ab6c0b9393c9356f229784a4385c02f99e94fc94d4')
b2sums=('f3a131227d567c3848a10870378a2d6b23ed188333dc4092c1443ff3ee999d9c19c7365b7c4062ea0f0a771f0efd3331662e6a59d6774b84764ea58d23c02e16')

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
