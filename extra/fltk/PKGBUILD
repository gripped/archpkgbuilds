# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=fltk
pkgname=(fltk fltk-docs)
pkgver=1.3.11
pkgrel=1
pkgdesc="Graphical user interface toolkit for X"
arch=(x86_64)
license=('LGPL-2.0-only WITH FLTK-exception')
url="https://www.fltk.org/"
makedepends=(
  alsa-lib
  cmake
  doxygen
  fontconfig
  libglvnd
  libjpeg-turbo
  libpng
  libx11
  libxcursor
  libxfixes
  libxft
  libxinerama
  libxrender
  mesa
)
source=(https://github.com/$pkgbase/$pkgbase/archive/release-$pkgver/$pkgbase-release-$pkgver.tar.gz)
sha512sums=('b18ff6322349af4416a37d28c4f42ebe355260786ed42bdd54dcc20dc92db1a38a8db74e6d637fdff8f320bdd51e2515c0fa939d30679c5f22ea99fb32c97204')
b2sums=('13f5a208f6fe19e4df3184be1143042d6469b5518f2771d60c8bba543129660c9b3d7ed5cb547cf364c91d6abd1d5d4f538dede0bfdf57db26ae9f4a8e4d069a')

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
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D FLTK_LIBDIR=/usr/lib
    -D OPTION_BUILD_SHARED_LIBS=ON
    -D OPTION_BUILD_HTML_DOCUMENTATION=ON
    -D OPTION_INSTALL_HTML_DOCUMENTATION=ON
    -S $pkgbase-release-$pkgver
    -W no-dev
  )

  # fat-lto-objects is required for non-mangled .a files in fltk
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
  # build documentation explicitly as it is otherwise not generated/ installed
  make VERBOSE=1 -C build/documentation html
}

check() {
  ctest --test-dir build --output-on-failure
}

package_fltk() {
  depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    fontconfig libfontconfig.so
    libglvnd
    libjpeg-turbo
    libpng
    libx11
    libxcursor
    libxext
    libxfixes
    libxft
    libxinerama
    libxrender
    sh
  )
  provides=(
    libfltk_images.so
    libfltk_gl.so
    libfltk_forms.so
    libfltk.so
  )
  options=(
    !docs
    staticlibs
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgbase-release-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove man pages of examples
  rm -rvf "$pkgdir/usr/share/man/man6"

  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc/$pkgname/html
  )
}

package_fltk-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-release-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
