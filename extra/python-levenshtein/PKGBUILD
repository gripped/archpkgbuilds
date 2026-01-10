# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.27.3
pkgrel=2
pkgdesc='Python extension for computing string edit distances and similarities'
arch=(x86_64)
url='https://github.com/rapidfuzz/Levenshtein'
license=(GPL-2.0-or-later)
depends=(
  glibc
  gcc-libs
  python
  python-rapidfuzz
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-scikit-build-core
  cython
  rapidfuzz-cpp
)
checkdepends=(python-pytest)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-version-constraints.patch
)
sha512sums=('ec7b2a247df8848d3eb7a4a6add7ee037ca4c6dc9cedecb70a71d7b833bc22393e96235dc675f32abea5b5736162d2f4476c2996d748771763fa57f7de829ef8'
            'ec38b47cdb885d007e24d27aeb787b41749aff523fecc7863919fe6a5cd747bbe787419ea19d6bb9f0d4f69e00200d3eb965aea638c833675bd4cb004b568b06')
b2sums=('699c78707f2f1c5837def6a150c8695f513e4f03ac3a4c26450f73730da8a7096577b96848b47281e2dbcf2fafbdde8ac51a69e1f12331c6e055cdab57c8f1a8'
        '6ac4bc86024509df167330cb36dea7e2a43cdf69092ccc8ade7ed2e44636e7dd204789b39a823e6e5fd1eeac8bbaf2c787ece708807f9e31bbdf7f0e07f33d5f')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
  sed -e 's|-m cython|-m cython --cplus|g' -i src/Levenshtein/CMakeLists.txt # Fix build with cython 3.2
}
build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
