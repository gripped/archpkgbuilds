# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.12.1
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=('x86_64')
url='https://github.com/rapidfuzz/RapidFuzz'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'cython'
  'python-scikit-build-core'
  'rapidfuzz-cpp'
)
checkdepends=('python-hypothesis' 'python-pandas' 'python-pytest')
optdepends=('python-numpy')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'github.com-taskflow-taskflow::git+https://github.com/taskflow/taskflow'
)
sha512sums=('472804052f06f337fb310b175a61fb1778f4e3085d61da50471902a372d49086383b4b1f71dfd90cebda37471e8003f54b4dca00f6d1f64512ba7eb7e042a17e'
            'SKIP')
b2sums=('243375162f2c9f011682012a2262e85b49ec92575889b9b67639cb13c95968c08fa9b3ba6db03cc7dbf0dd0d6fb21ed2221446bcaf15ac4a2eef5fcd62672d94'
        'SKIP')

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init extern/taskflow
  git config submodule.extern/taskflow.url "$srcdir/github.com-taskflow-taskflow"
  git -c protocol.file.allow=always submodule update
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
