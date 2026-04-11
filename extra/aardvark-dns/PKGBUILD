# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=aardvark-dns
pkgver=1.17.1
pkgrel=1
pkgdesc="Authoritative dns server for A/AAAA container records"
arch=(x86_64)
url="https://github.com/containers/aardvark-dns"
license=(Apache-2.0)
depends=(
  glibc
  libgcc
)
makedepends=(
  cargo
  git
)
source=(git+$url#tag=v$pkgver)
sha256sums=('79b0e546dc6d3102ef25082f189ec7507ac52186961ba0ffda6d8be974f6e1e5')
# NOTE: pinning commit until upstream clarifies commitment to chain of trust:
# https://github.com/containers/aardvark-dns/issues/83
# validpgpkeys=('74FE091D25519980B2D84447160386BECB6F0643')  # Brent Baude <bbaude@redhat.com>

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname
  cargo test --frozen --all-features
}

package() {
  cd $pkgname
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/lib/podman/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
