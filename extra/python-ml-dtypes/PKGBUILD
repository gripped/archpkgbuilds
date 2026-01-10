# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
pkgver=0.5.4
pkgrel=2
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML'
arch=('x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache-2.0' 'MPL-2.0')
depends=('gcc-libs' 'glibc' 'python-numpy')
makedepends=('python-absl' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/jax-ml/ml_dtypes#tag=v$pkgver"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git")
sha256sums=('f0ccad4d8bb75af0b8db2d07167a96e0bdcccb19139c63d706ae8dbda7e649c8'
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
