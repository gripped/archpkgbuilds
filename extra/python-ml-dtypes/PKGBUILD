# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
pkgver=0.5.3
pkgrel=1
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML'
arch=('x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache-2.0' 'MPL-2.0')
depends=('gcc-libs' 'glibc' 'python-numpy')
makedepends=('python-absl' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/jax-ml/ml_dtypes#tag=v$pkgver"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git")
sha256sums=('490512f1a05a60c7b2166898c2a66ee9be5768795723f9dde4267327b5876b1f'
            'SKIP')

prepare() {
  cd ml_dtypes

  git submodule init

  git config submodule."eigen".url "${srcdir}/${pkgname}"-eigen

  git -c protocol.file.allow=always submodule update --init --recursive

  # They fix their setuptools version to something silly so we'll get rid of that.
  sed -i 's/setuptools~=.*\"/setuptools"/' pyproject.toml
}

build() {
  cd ml_dtypes
  python -m build --wheel --no-isolation
  python setup.py build_ext -i
}

check() {
  cd ml_dtypes
  PYTHONPATH=$(pwd) pytest
}

package() {
  ls -lha ml_dtypes/dist
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    ml_dtypes/dist/ml_dtypes*.whl
}
