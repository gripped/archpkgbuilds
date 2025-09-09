# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.14.1
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
sha512sums=('d06e88edf652d2d2dbdad6c5b10d61f11dce77ee2a1c03d9670a9708ff6f93636b872b0a942cfcf09bee53515a358f6608db0e1b0a3c048ff5408a05f05cb0ba'
            'SKIP'
            '997ef42ea45ea226aa1fcb43938a920318e19c49c6420530ea483f999f5d695b3fdb3a6e7cff21062cdebeb834dc6aa044519fa1ad473ce09afc16df6caddc72')
b2sums=('cc729e640fa3233df3ffc264212f1e903bc764ab20d6b8070865f254357e51663c7f9a0af1453496f2a0998887749997e85bfbbc389568b0892de69a4d826ca9'
        'SKIP'
        '6c4076c26c30c6c31f69283f95c5dbb2ac830fc9b7edaa386419ae17c72b9eaa5100f61f3bee0e99caf2f766893fc893ad216fb7d5e8c0c93ddd71aadc1c37e7')

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
