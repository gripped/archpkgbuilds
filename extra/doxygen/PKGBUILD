# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=doxygen
pkgname=(doxygen doxygen-docs)
pkgver=1.13.1
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP'
url='http://www.doxygen.nl'
arch=(x86_64)
license=(GPL-2.0-or-later)
makedepends=(
  clang
  cmake
  flex
  fmt
  gcc-libs
  ghostscript
  glibc
  graphviz
  llvm
  python
  qt6-base
  spdlog
  sqlite
  texlive-fontsrecommended
  texlive-fontutils
  texlive-latexextra
  texlive-plaingeneric
)
source=(
  ${pkgbase}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz
)
sha512sums=('9688958a3104a73b13c23ec44359647b366a1721134361b19518650cb9cb814e32507b472f5f0b37ac7107e667b891193744ae64d5f27e4cd84c099878750514')
b2sums=('c73fa721cb9de860e2797bfcee8858056472698d88040f153e71572b82f708b035b3e66594e76ed58b8bcb8f7ede1cd0525ea704f35c0de9f5b93cf72f7f2b1d')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  local cmake_options=(
    -B build
    -S $pkgbase-Release_${pkgver//./_}
    -W no-dev
    -DCMAKE_BUILD_TYPE:STRING=None
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DDOC_INSTALL_DIR:PATH=share/doc/doxygen
    -Dbuild_doc:BOOL=ON
    -Dbuild_wizard:BOOL=ON
    -Duse_sys_spdlog:BOOL=ON
    -Duse_sys_sqlite3:BOOL=ON
    -Duse_libclang:BOOL=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
  cmake --build build --target docs
}

check() {
  ctest --test-dir build --output-on-failure
}

package_doxygen() {
  depends=(
    clang
    fmt libfmt.so
    gcc-libs
    glibc
    spdlog libspdlog.so
    sqlite libsqlite3.so
  )
  optdepends=(
    'graphviz: for caller/callee graph generation'
    'qt6-base: for doxywizard'
    'texlive-fontsrecommended: for generating LaTeX, Postscript and PDF output'
    'texlive-fontutils: for generating LaTeX, Postscript and PDF output'
    'texlive-latexextra: for generating LaTeX, Postscript and PDF output'
    'texlive-plaingeneric: for generating LaTeX, Postscript and PDF output'
  )

  DESTDIR="$pkgdir" cmake --install build
  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc
  )
  install -vDm 644 $pkgbase-Release_${pkgver//./_}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_doxygen-docs() {
  pkgdesc='Developer documentation for doxygen'

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-Release_${pkgver//./_}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
