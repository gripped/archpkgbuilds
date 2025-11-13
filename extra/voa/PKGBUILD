# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.4.1
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
source=(
  $pkgname::git+${_url}.git?signed#tag=$pkgname/$pkgver
)
sha512sums=('0d6644b4b15e6a3f513f5738dad241091267cd942e4b238c01565885ec7d6cbf377891335bdecae6ad728679a28e3f9b0f47f8f6286516b2dae13542b53bf54c')
b2sums=('2525fd7ccea3ba2ad4f688066f4b25b0130c83d0d7cfd354908b266bdb8b0746d52c57088c646f6e2fb6f955945d5eb46d45768de79d4f5074312a1109fea8e1')
validpgpkeys=(991F6E3F0765CF6295888586139B09DA5BF0D338)  # David Runge <dvzrv@archlinux.org>

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  cargo build --features cli --frozen --release --package voa

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
