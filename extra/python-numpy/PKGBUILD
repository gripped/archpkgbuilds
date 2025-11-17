# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=python-numpy
pkgver=2.3.5
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('blas-openblas: faster linear algebra')
makedepends=('git' 'python-build' 'python-installer' 'meson-python' 'cmake' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
source=(git+https://github.com/numpy/numpy#tag=v$pkgver
        numpy-meson::git+https://github.com/numpy/meson.git
        numpy-highway::git+https://github.com/google/highway.git
        numpy-x86-simd-sort::git+https://github.com/intel/x86-simd-sort
        numpy-pocketfft::git+https://github.com/mreineck/pocketfft
        numpy-svml::git+https://github.com/numpy/SVML.git
        numpy-pythoncapi-compat::git+https://github.com/python/pythoncapi-compat)
sha512sums=('2cc2f09fbd67f8d6c3ca24191cb7dee87c801ca2fd82a6256117366a4b54da43e0ca257c3ea8cf5379c4721997df4f9203fc96567075468302106e1e32784639'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd numpy

  git submodule init
  git submodule set-url vendored-meson/meson "$srcdir"/numpy-meson
  git submodule set-url numpy/_core/src/highway "$srcdir"/numpy-highway
  git submodule set-url numpy/_core/src/npysort/x86-simd-sort "$srcdir"/numpy-x86-simd-sort
  git submodule set-url numpy/fft/pocketfft "$srcdir"/numpy-pocketfft
  git submodule set-url numpy/_core/src/umath/svml "$srcdir"/numpy-svml
  git submodule set-url numpy/_core/src/common/pythoncapi-compat "$srcdir"/numpy-pythoncapi-compat
  git -c protocol.file.allow=always submodule update \
      vendored-meson/meson \
      numpy/_core/src/highway \
      numpy/_core/src/npysort/x86-simd-sort \
      numpy/fft/pocketfft \
      numpy/_core/src/umath/svml \
      numpy/_core/src/common/pythoncapi-compat
}

build() {
  cd numpy
  CFLAGS+=" -ffat-lto-objects" \
  CXXFLAGS+=" -ffat-lto-objects" \
  python -m build --wheel --no-isolation \
    -Csetup-args="-Dblas=cblas" \
    -Csetup-args="-Dlapack=lapack" \
    -Csetup-args="-Denable-openmp=true"
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd numpy
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/numpy-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
