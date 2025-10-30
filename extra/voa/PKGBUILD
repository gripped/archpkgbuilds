# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI for interacting with the File Hierarchy for the Verification of OS Artifacts (VOA)"
arch=(x86_64)
url="https://voa.archlinux.page"
_url="https://gitlab.archlinux.org/archlinux/alpm/voa"
license=('Apache-2.0 OR MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  git
  just
  rust
  rust-script
)
checkdepends=(
  cargo-nextest
)
source=($pkgname::git+${_url}.git?signed#tag=$pkgname/$pkgver)
sha512sums=('327e8d0e0a361885b44a4747640668fea80e25bab8345e3129ed53a28a2d3facd889cf0ad06a3edde6618f28a5c34e3ef549e9a05e693a677f8ce0545bd775a2')
b2sums=('579ca743e808b7870d2d79be687ffc41617e72afada2ba51d1367b352196c1b91ca1b8eceff3b1395b48600888eee23f6aa45e24d30d6cd521e2195d9a704dc2')
validpgpkeys=(991F6E3F0765CF6295888586139B09DA5BF0D338)  # David Runge <dvzrv@archlinux.org>

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  cargo build --frozen --release

  just generate shell_completions voa
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
  install -vDm 644 output/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 output/shell_completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 output/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
