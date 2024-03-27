# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=dump_syms
pkgver=2.3.1
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
_commit=8100c54d307bce2fb73484bbe46a04386ceca105  # tags/v2.3.1^0
source=("git+$url#commit=$_commit")
b2sums=('a018041c9de88ef0d34e07ecc4c7a88756cf9a9fa60b6758bd1b50a9acde4201ed416def26edaf8a5bcafd046e3acf549ae3d2266129c02a7eaee76389908dfd')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $pkgname
  cargo build --release --frozen --all-targets
}

check() {
  cd $pkgname
  cargo test --release --frozen
}

package() {
  cd $pkgname
  install -Dt "$pkgdir/usr/bin" target/release/dump_syms
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE-MIT
}

# vim:set sw=2 sts=-1 et:
