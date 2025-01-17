# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgbase=fmt
pkgname=(
  fmt
  fmt-docs
)
pkgver=11.1.2
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
_tag=8303d140a1a11f19b982a9f664bbe59a1ccda3f4
source=("git+https://github.com/fmtlib/fmt.git#tag=$_tag")
b2sums=('72c7027f23292ccd5bdcc3b797547a52b9a3c59e98485a7b2bfcefcd482fb2efb761966947f42eb61bdb6f195ebbede80f18ad603b8ccc0d1a744575433892f6')

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
