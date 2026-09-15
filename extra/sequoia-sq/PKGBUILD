# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-sq
pkgver=1.4.0
pkgrel=2
pkgdesc='Command-line frontends for Sequoia'
url='https://sequoia-pgp.org/'
arch=(x86_64)
license=(LGPL-2.0-or-later)
groups=(sequoia)
replaces=(sequoia)
depends=(
  glibc
  gmp
  libgcc
  sqlite
)
makedepends=(
  capnproto
  cargo
  clang
  git
  nettle3
  openssl
)
options=(!lto)
source=(git+https://gitlab.com/sequoia-pgp/sequoia-sq.git?signed#tag=v$pkgver)
sha512sums=('e05d2de72e2954c299ce6c5db379eaa6c815a45b15e43f6bfb3ededb3eaa36cfce4049829d745804aafcf3eb6779b43d971287acdea7da00e8a0baceabcf7f97')
b2sums=('cef82d4e4135d3bd0afbbedcead4bdebb480740d73ec5318b64ea8698fcbfb32241669355564c766b52099d2ec11d78b5c64c21d686211bd03518e95f1acb6a7')
validpgpkeys=(
  CBCD8F030588653EEDD7E2659B7DD433F254904A  # Justus Winter <justus@sequoia-pgp.org>
  8F17777118A33DDA9BA48E62AACB3243630052D9  # Neal H. Walfield <neal@sequoia-pgp.org>
)

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname
  export CARGO_TARGET_DIR=../target
  export ASSET_OUT_DIR=../target
  export PKG_CONFIG_PATH=/usr/lib/nettle3/pkgconfig
  export RUSTFLAGS+=" -L/usr/lib/nettle3"
  # NOTE: we select specific (default) features, as there are multiple crypto backends
  cargo build --release --frozen --features default
}

check() {
  cd $pkgname
  export PKG_CONFIG_PATH=/usr/lib/nettle3/pkgconfig
  export RUSTFLAGS+=" -L/usr/lib/nettle3"
  cargo test --frozen --features default
}

package() {
  depends+=(
    nettle3 libnettle.so libhogweed.so
    openssl libcrypto.so libssl.so
  )

  install -vDm 755 target/release/sq -t "$pkgdir/usr/bin"
  install -vDm 644 target/shell-completions/sq.bash "$pkgdir/usr/share/bash-completion/completions/sq"
  install -vDm 644 target/shell-completions/_sq -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 target/shell-completions/sq.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 target/man-pages/*.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
