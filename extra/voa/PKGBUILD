# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.4.0
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
  voa-0.4.0-rust-script.patch
)
sha512sums=('d8729308a717e136df4137a84b9b1e5bcbe648fc3717ea1628ae49878cc48aac07637df8c4184b776147a9ab0ad1877c546aeae8fcc844dc874226ae0fe57c1e'
            '7c49b0513dc3b585f1de6456095b75c5ebbfaf6bc7e6ba556c91253885e07334bc971b83c237556b119630266b6c96d8ae434939fbf5eb79dc012e1c7a915404')
b2sums=('bb383089d3465d6b1b088eb872186667a83ae45253714c3dc84d29dce1c21a14ddfce3769088f7973aa9d3b705fc33aa83b5c1368fdedb3a8c956f2ca7eb16a6'
        '0de81de5c8d7427b6ee73a94e96b65743e9133370a602f884081502f72eec47cb4a8c1e3916dd662756657b5cccda571eab7606a3ec1e41e1bbff7b9089c7974')
validpgpkeys=(991F6E3F0765CF6295888586139B09DA5BF0D338)  # David Runge <dvzrv@archlinux.org>

prepare() {
  # Fix an issue with the rust-script used for generating manpages/shell completions.
  patch -Np1 -d $pkgname -i ../voa-0.4.0-rust-script.patch

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
