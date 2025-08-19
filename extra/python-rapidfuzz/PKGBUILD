# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.13.0
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=(x86_64)
url='https://github.com/rapidfuzz/RapidFuzz'
license=(MIT)
depends=(
  glibc
  gcc-libs
  python
)
makedepends=(
  git
  python-build
  python-installer
  cython
  python-scikit-build-core
  rapidfuzz-cpp
)
checkdepends=(
  python-hypothesis
  python-pandas
  python-pytest
)
optdepends=(python-numpy)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'github.com-taskflow-taskflow::git+https://github.com/taskflow/taskflow'
  remove-version-constraints.patch
)
sha512sums=('024f084879018e6ac6a165a776405e7bd6b5265c8842e77119c8f9b139580500a603c754e504b080d7311ba59721193ead6a61e125f5a45027ce3da90da59b8e'
            'SKIP'
            '48d6f5d903b7aad221d518f1e9133b11736dd1a83dd5a7246f612c9caeb41673c8a7b3ae16bad112ef4506f94470cedcd23d94167def914f284ca73edf43614f')
b2sums=('f5aeff8827d52327220ab91a896c0085c84fd214cb4079f8140681d7bb82a019e8316aaf4596464fcfd6fcead5d6ef20b27cb16717ca9cf6e96128f9f45ee244'
        'SKIP'
        '74d5f512da462245c146d2f26efce13e80781a2d5b78bd0ad77b6730882b26bd2c0a9587a4fa0ded7920e4fa595264c64bcc54d5fe6780ff33d3ab8d238d8401')

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init extern/taskflow
  git config submodule.extern/taskflow.url "$srcdir/github.com-taskflow-taskflow"
  git -c protocol.file.allow=always submodule update

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
}

build() {
  cd "$pkgname"

  RAPIDFUZZ_BUILD_EXTENSION=1 \
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

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
