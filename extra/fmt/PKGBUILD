# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgbase=fmt
pkgname=(
  fmt
  fmt-docs
)
pkgver=11.1.3
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
_tag=9cf9f38eded63e5e0fb95cd536ba51be601d7fa2
source=("git+https://github.com/fmtlib/fmt.git#tag=$_tag")
b2sums=('cab07694562864d5549cffc87ecf3553be7bb8b8a4bc20fe105723b2ac0406aec12167cddc7f9cdbc247d3203cc122cef1b93e3b04efcb6171d5e46e66555fa5')

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
