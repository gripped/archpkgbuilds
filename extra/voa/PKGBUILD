# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.7.0
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
sha512sums=('fd25c0beb1d11724958d5ebb2fef6dbe2352b89c3d4d69b31786e42573a26485829f97e4d32976297537484cdde8e8ce05c378d9e9a4e0b62f4ba5b5bf5c3765')
b2sums=('83c94671a4168819cc4802247bc727afc40b856a593cc50eb8773893f55275bce16b4a720d8d21c455f22c23065406b1f02391b06d570f3364b9b4bb25159d2b')
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
