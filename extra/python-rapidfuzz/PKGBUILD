# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.14.2
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
sha512sums=('396fc04e6a9dfc8bd422285709214833050f429dad731a62897917d8c28af03c89434846651dfab8eb694feef90691b15a4a7831e07619c587c7842e912dc746'
            'SKIP'
            '43771f873fbf91e3bad9a1e0653e30ec54523a278195ea642622f15ab2fdcbdf0d2037819ce01e0f0e6d445a36695bd8f4638ce1be80a2bdcbbc83ec516fa01a')
b2sums=('46bc3ba2c6fed22665f2c00ea24ebcc738190650f19ddd4b5a3b86c7cd35a4310b72e25273df1e8f3727547f7ad3e24ed385cde8ad4cce88cf8a6a2a6c7b7313'
        'SKIP'
        '156581b1e900d951008e489c22e887728baf0f014ea6e4848226ceca683baa16b7f8bcd979b7db42e9e65b029fd74fe9f66c10862a53ed8e08bc6142af406370')

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
