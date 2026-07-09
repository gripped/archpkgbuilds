# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.7.5
pkgrel=1
pkgdesc="CLI for interacting with the File Hierarchy for the Verification of OS Artifacts (VOA)"
arch=(x86_64)
url="https://voa.archlinux.page"
_url="https://gitlab.archlinux.org/archlinux/alpm/voa"
license=('Apache-2.0 OR MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  git
  just
  lowdown
  rust
  rust-script
)
checkdepends=(
  cargo-nextest
)
source=(
  $pkgname::git+${_url}.git?signed#tag=$pkgname/$pkgver
)
sha512sums=('c1e95ec42a058efb3f8adc8825a84d8603510686c4a066d077d38116ea2a4ecceb2f6e4c68efcad1101043850a0a2d8239733562fce2054a5ceb920bfcb072f6')
b2sums=('1149c8a2fa781768a4cd1941768c7b47036fd1814d07f186530bfe5ec7fd9b7a79000165de0183d3abe043743ba4d37736dea1ca90922fbbe2c76be9a4c95afc')
validpgpkeys=(991F6E3F0765CF6295888586139B09DA5BF0D338)  # David Runge <dvzrv@archlinux.org>

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname
  cargo build --features cli --frozen --release --package voa

  just generate shell_completions voa
  just generate specifications voa-config
  just generate manpages voa
}

check() {
  cd $pkgname
  XDG_RUNTIME_DIR="/run/user/$(uid)/" cargo nextest run --package voa
}

package() {
  cd $pkgname
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/bin/"

  install -vDm 644 output/manpages/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 output/manpages/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -vDm 644 output/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 output/shell_completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 output/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
