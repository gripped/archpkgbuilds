# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgbase=fmt
pkgname=(
  fmt
  fmt-docs
)
pkgver=12.1.0
pkgrel=1
pkgdesc='Open-source formatting library for C++'
arch=(x86_64)
url=https://fmt.dev
license=(MIT)
makedepends=(
  cmake
  doxygen
  git
  mkdocs
  mkdocs-material
  mkdocstrings
  ninja
  npm
  python-pymdown-extensions
  python-regex
)
_tag=407c905e45ad75fc29bf0f9bb7c5c2fd3475976f
source=("git+https://github.com/fmtlib/fmt.git#tag=$_tag")
b2sums=('75eb322bb23e10fc8d698fedf775fa1313e5699ab81a8a1193b7f1ec7e10b4ba92631ffffddeefe0c4390676e8412a684e98717a94bafdb662b25111cc0d8e00')

pkgver() {
  cd fmt
  git describe --tags
}

build() {
  cmake -S fmt -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
  cmake --build build --target doc
}

check() {
  cmake --build build --target test
}

package_fmt() {
  depends=(
    gcc-libs
    glibc
  )
  provides=(libfmt.so)

  DESTDIR="$pkgdir" cmake --install build --component fmt_core
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" fmt/LICENSE
}

package_fmt-docs() {
  pkgdesc+=' (documentation)'

  DESTDIR="$pkgdir" cmake --install build --component fmt_doc
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" fmt/LICENSE
}

# vim: ts=2 sw=2 et:
