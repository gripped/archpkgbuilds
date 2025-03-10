# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgbase=fmt
pkgname=(
  fmt
  fmt-docs
)
pkgver=11.1.4
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
_tag=123913715afeb8a437e6388b4473fcc4753e1c9a
source=("git+https://github.com/fmtlib/fmt.git#tag=$_tag")
b2sums=('e150c93041012709b36cd29ac17b79f988f8ed16f49f6dd900628d42062b753407244eb2a4e8a45c992f0fded8fca19951124bb36f6797b51daa75c9e09843d3')

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

  DESTDIR="$pkgdir" cmake --install build --component fmt-core
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" fmt/LICENSE
}

package_fmt-docs() {
  pkgdesc+=' (documentation)'

  DESTDIR="$pkgdir" cmake --install build --component fmt-doc
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" fmt/LICENSE
}

# vim: ts=2 sw=2 et:
