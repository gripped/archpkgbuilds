# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
pkgver=0.5.2
pkgrel=1
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML'
arch=('x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache-2.0' 'MPL-2.0')
depends=('gcc-libs' 'glibc' 'python-numpy')
makedepends=('python-absl' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
source=("ml-dtypes-$pkgver.tar.gz::https://github.com/jax-ml/ml_dtypes/archive/refs/tags/v$pkgver.tar.gz"
        'ml-dtypes.diff'
        "eigen-7bf2968.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/7bf2968fed5f246c0589e1111004cb420fcd7c71/eigen-7bf2968.tar.gz")
sha256sums=('72c2282950f83756fee018a90a87bc9317cfc86355154b234bbf0c3f4db72680'
            '8c3cf615ce8eb66c1a3b0b1bad20381cc5ae9cc4aa656ab613e029349a7b1cc0'
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

check() {
  cd ml_dtypes-$pkgver
  PYTHONPATH=$(pwd) pytest
}

package() {
  ls -lha ml_dtypes-$pkgver/dist
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    ml_dtypes-$pkgver/dist/ml_dtypes*.whl

  # Remove artefacts of broken distribution.
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rfv "$pkgdir"/usr/lib/python"$python_version"/site-packages/third_party
}
