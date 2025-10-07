# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgbase=fmt
pkgname=(
  fmt
  fmt-docs
)
pkgver=12.0.0
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
_tag=e424e3f2e607da02742f73db84873b8084fc714c
source=("git+https://github.com/fmtlib/fmt.git#tag=$_tag")
b2sums=('3cc82aae85fc4283e28360b13d3a11eb0b1e8bbe59f4db9ad63fc9806c73d028298ca1b6ab0033a31a311054d7111d299db52a99203cb4d97be56bee7aad232f')

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
