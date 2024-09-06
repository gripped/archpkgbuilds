# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=dump_syms
pkgver=2.3.4
pkgrel=1
pkgdesc="Symbol dumper for Firefox"
url="https://github.com/mozilla/dump_syms"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  git
)
options=(!lto)
source=("git+$url#tag=v$pkgver")
b2sums=('3dfcbb3ca017cca4d4ce2b2f3be7dd1bdcebd56ba618b3766fa8ccee0999ecaaaabbcdda9c1679386a2af1e6e2aaa00d996d3392ad59ea42f19394793ef15b2f')

prepare() {
  cd $pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $pkgname

  # Use debug
  export CARGO_PROFILE_RELEASE_DEBUG=2

  # Use LTO
  export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

  cargo build --release --frozen --all-targets
}

check() {
  cd $pkgname
  cargo test --frozen
}

package() {
  cd $pkgname
  install -Dt "$pkgdir/usr/bin" target/release/dump_syms
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE-MIT
}

# vim:set sw=2 sts=-1 et:
