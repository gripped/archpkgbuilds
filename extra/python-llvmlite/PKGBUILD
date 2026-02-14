# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgname=python-$_name
pkgver=0.46.0
pkgrel=4
pkgdesc="A lightweight LLVM Python binding for writing JIT compilers"
arch=(x86_64)
url="https://github.com/numba/llvmlite"
license=("BSD-2-Clause AND Apache-2.0 WITH LLVM-exception")
depends=(
    glibc
    libgcc
    libstdc++
    llvm20-libs
    python
)
makedepends=(
    cmake
    git
    llvm20
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
)
source=(git+https://github.com/numba/llvmlite.git#tag=v$pkgver)
b2sums=('eca78d05f0b7c1d52441071fe7ac31c706bc9d81c12945f1c7568fb0d36f54d1b0b55d922f4204dbd2772c7c169b1401e61a6686df6402e74a960f7085b37c90')

prepare() {
    cd $_name
    # Update setup.py to use setuptools
    git cherry-pick -n e6a4cf1bd9b1ac213124ef125cae44896ed9885c
}

build() {
    cd $_name
    export PATH="/usr/lib/llvm20/bin:$PATH"
    LLVMLITE_SHARED=ON python -m build --wheel --no-isolation
}

check() {
    cd $_name
    pytest -vv $_name/tests
}

package() {
    cd $_name

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -vDm 644 LICENSE LICENSE.thirdparty -t "$pkgdir"/usr/share/licenses/$pkgname/
}
