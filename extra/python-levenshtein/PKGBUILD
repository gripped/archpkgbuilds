# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.27.2
pkgrel=1
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
sha512sums=('3a076fc7024d93a61e35a961a5cecae35cc72bfc5edbe9df69d85e753cadc44f21bbfa87579a059b5f2daf2502211fccd582f98a4d1877dfd1742d26f2347f43'
            'ec38b47cdb885d007e24d27aeb787b41749aff523fecc7863919fe6a5cd747bbe787419ea19d6bb9f0d4f69e00200d3eb965aea638c833675bd4cb004b568b06')
b2sums=('87c603d2b97369b71676c3c20823754dd68ca602828dd2e9fb7072a45f4d4538a15508b0c6f57185f5daca656c462eea9a15f920580e37290d158fa48b09cecb'
        '6ac4bc86024509df167330cb36dea7e2a43cdf69092ccc8ade7ed2e44636e7dd204789b39a823e6e5fd1eeac8bbaf2c787ece708807f9e31bbdf7f0e07f33d5f')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
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
