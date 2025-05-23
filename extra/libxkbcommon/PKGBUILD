# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgbase=libxkbcommon
pkgname=(
  libxkbcommon
  libxkbcommon-x11
  libxkbcommon-doc
)
pkgver=1.9.2
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64)
license=(MIT)
makedepends=(
  bash-completion
  doxygen
  git
  glibc
  graphviz
  libxcb
  libxml2
  meson
  wayland
  wayland-protocols
  xkeyboard-config
  xorgproto
)
checkdepends=(
  libgl
  xorg-server-xvfb
)
source=("git+https://github.com/xkbcommon/libxkbcommon#tag=xkbcommon-$pkgver")
b2sums=('ccbd310122d3eafbaca76bb8d37894aa9f2d738fa31e13a06def71c525980b7ddfa591cbb89da3419b3be03202afbe42c9862e6204a002f90a71aff1d921516f')

prepare() {
  cd libxkbcommon
}

build() {
  local meson_options=(
    -D enable-docs=true
  )

  arch-meson libxkbcommon build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libxkbcommon() {
  depends=(
    glibc
    libxml2
    xkeyboard-config
  )
  optdepends=(
    'libxkbcommon-x11: xkbcli interactive-x11'
    'wayland: xkbcli interactive-wayland'
  )
  provides=(
    libxkbcommon.so
    libxkbregistry.so
  )

  meson install -C build --destdir "$pkgdir"

  _pick x11 "$pkgdir"/usr/lib/*x11*
  _pick x11 "$pkgdir"/usr/lib/pkgconfig/*x11*
  _pick x11 "$pkgdir"/usr/lib/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/include/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/share/man/man1/*x11*

  _pick doc "$pkgdir"/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-x11() {
  pkgdesc='Keyboard handling library using XKB data for X11 XCB clients'
  depends=(
    glibc
    libxcb
    libxkbcommon
    libxkbcommon.so
  )
  provides=(
    libxkbcommon-x11.so
  )

  mv x11/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-doc() {
  pkgdesc='API documentation for libxkbcommon'

  mv doc/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

# vim:set sw=2 sts=-1 et:
