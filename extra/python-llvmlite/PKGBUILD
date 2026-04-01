# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgname=python-$_name
pkgver=0.47.0
pkgrel=1
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
b2sums=('7d39be636d74e6c249d4983bf7be888fcf79bb046aae3305dc4bacf646735ab69783d79bc397b22067c0a78dacc48d4c3c7f80796ebbf2d3c8cdb273e43e58b9')

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
