# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=bat
pkgver=0.25.0
pkgrel=4
pkgdesc='Cat clone with syntax highlighting and git integration'
arch=(x86_64)
url='https://github.com/sharkdp/bat'
license=('Apache-2.0 OR MIT')
depends=(gcc-libs glibc libgit2 oniguruma zlib)
makedepends=(cargo-edit clang cmake git rust)
source=("git+$url#tag=v$pkgver")
b2sums=('900a83b54404578e7466ea8d1f614a61c7c7086f10c98562fbc195a5a522fa3a8b41e20b2f3a731a3c6d1c17f64f0b82190c5e131466ab43768bc26ae544e1a3')

prepare() {
  # for libgit2-1.9 rebuild, remove when upstream releases
  # https://github.com/sharkdp/bat/pull/3169
  cargo upgrade -p git2@0.20.0 --manifest-path $pkgname/Cargo.toml
  cargo fetch --locked --manifest-path $pkgname/Cargo.toml
}

build() {
  CFLAGS+=' -ffat-lto-objects -w'
  export LIBGIT2_NO_VENDOR=1
  cargo build --locked --manifest-path $pkgname/Cargo.toml --release
}

check() {
  export LIBGIT2_NO_VENDOR=1
  cargo test --locked --manifest-path $pkgname/Cargo.toml
}

package() {
  depends+=(libgit2.so)
  install -Dm755 $pkgname/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Package licenses
  install -Dm644 $pkgname/LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 $pkgname/LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  cd $pkgname/target/release/build

  # Find and package the man page (because cargo --out-dir is too new)
  find . -name bat.1 -type f -exec install -Dm644 {} \
    "$pkgdir/usr/share/man/man1/bat.1" \;

  # Find and package the bash completion file
  find . -name bat.bash -type f -exec install -Dm644 {} \
    "$pkgdir/usr/share/bash-completion/completions/bat" \;

  # Find and package the zsh completion file (not in zsh-completions yet)
  find . -name bat.zsh -type f -exec install -Dm644 {} \
    "$pkgdir/usr/share/zsh/site-functions/_bat" \;

  # Find and package the fish completion file
  find . -name bat.fish -type f -exec install -Dm644 {} \
    "$pkgdir/usr/share/fish/vendor_completions.d/bat.fish" \;
}
