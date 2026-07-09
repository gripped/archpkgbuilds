# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgname=python-$_name
pkgver=0.48.0
pkgrel=1
pkgdesc="A lightweight LLVM Python binding for writing JIT compilers"
arch=(x86_64)
url="https://github.com/numba/llvmlite"
license=("BSD-2-Clause AND Apache-2.0 WITH LLVM-exception")
depends=(
    glibc
    libgcc
    libstdc++
    llvm-libs
    python
)
makedepends=(
    cmake
    git
    llvm
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
)
source=(git+https://github.com/numba/llvmlite.git#tag=v$pkgver)
b2sums=('9ef3a3ae9781d97109eefcf87a58739383adaefc157b8fa44672da583e4c747ea5d86312ec7cb119562dbc344bd6a145a0b18b26dd29a83b2e3b7bead44e3ea8')

build() {
    cd $_name
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
