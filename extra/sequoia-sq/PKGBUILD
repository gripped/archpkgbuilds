# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-sq
pkgver=1.3.0
pkgrel=1
pkgdesc='Command-line frontends for Sequoia'
url='https://sequoia-pgp.org/'
arch=(x86_64)
license=(LGPL-2.0-or-later)
groups=(sequoia)
replaces=(sequoia)
depends=(
  gcc-libs
  glibc
  gmp
  openssl
  sqlite
)
makedepends=(
  bzip2
  capnproto
  cargo
  clang
  git
  nettle
)
options=(!lto)
source=(git+https://gitlab.com/sequoia-pgp/sequoia-sq.git?signed#tag=v$pkgver)
sha512sums=('c697aff32f76761a5fcc5c0c57af7b4ae9ececd974c733ec2069268db31e0efc184220ca43c6e85c77339a6316fc2c4e9fe142c2d9836dc4ee414c79ef04cca4')
b2sums=('050c9831dac75c3af6a873995edc75b5c555718d342ae594dd0966527c666f0ddf69d7498b9e0f3882d8d584228d0104e2b2fbec2e30b95184b686e34d0b7510')
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
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname
  export CARGO_TARGET_DIR=../target
  export RUSTUP_TOOLCHAIN=stable
  export ASSET_OUT_DIR=../target
  # NOTE: we select specific (default) features, as there are multiple crypto backends
  cargo build --release --frozen --features default
}

check() {
  cd $pkgname
  # NOTE: we use a different target dir, as otherwise cargo test --release alters the sq binary
  # https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/96
  export CARGO_TARGET_DIR=../target-test
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen --features default
}

package() {
  depends+=(
    bzip2 libbz2.so
    nettle libnettle.so libhogweed.so
  )

  install -vDm 755 target/release/sq -t "$pkgdir/usr/bin"
  install -vDm 644 target/shell-completions/sq.bash "$pkgdir/usr/share/bash-completion/completions/sq"
  install -vDm 644 target/shell-completions/_sq -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 target/shell-completions/sq.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 target/man-pages/*.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
