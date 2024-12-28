# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
pkgver=0.5.0
pkgrel=2
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML'
arch=('x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache-2.0' 'MPL-2.0')
depends=('gcc-libs' 'glibc' 'python-numpy')
makedepends=('python-absl' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
source=("ml-dtypes-$pkgver.tar.gz::https://github.com/jax-ml/ml_dtypes/archive/refs/tags/v$pkgver.tar.gz"
        'ml-dtypes.diff'
        "eigen-7bf2968.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/7bf2968fed5f246c0589e1111004cb420fcd7c71/eigen-7bf2968.tar.gz")
sha256sums=('b85469201d6d086c16bc718e111bdb619396fab6d817f518dfd850c77ffc8de3'
            '2a9ecd98a031db23416d93fc0255aeb22c4524f6fc7f19ae006b16f7fbc7743e'
            'beca76e4663a75ef3ff00b0704009a7a60cec3783ce3cada0b828982da87130b')

prepare() {
    ln -fs \
        "$srcdir"/eigen-7bf2968fed5f246c0589e1111004cb420fcd7c71/Eigen \
        "$srcdir"/ml_dtypes-$pkgver/third_party/eigen/Eigen

    cd ml_dtypes-$pkgver
    patch -Np1 -i ../ml-dtypes.diff
}

build() {
    cd ml_dtypes-$pkgver
    python -m build --wheel --no-isolation
    python setup.py build_ext -i
}

# check() {
#     cd ml_dtypes-$pkgver
#     PYTHONPATH=$(pwd) pytest
# }

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        ml_dtypes-$pkgver/dist/ml_dtypes-$pkgver-*-*.whl

    # Remove artefacts of broken distribution.
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -rfv "$pkgdir"/usr/lib/python"$python_version"/site-packages/third_party
}
