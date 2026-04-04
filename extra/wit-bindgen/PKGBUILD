# Maintainer: Frederik Schwan <freswa at archlinux.org>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wit-bindgen
pkgver=0.55.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types "
url="https://github.com/bytecodealliance/wit-bindgen"
arch=('x86_64')
license=('Apache-2.0' 'MIT')
depends=(
  cargo
  glibc
  libgcc
)
makedepends=(
  git
)
options=(!lto)
source=("git+https://github.com/bytecodealliance/wit-bindgen.git#tag=v${pkgver}")
sha256sums=('c52c9d8239173a5343fa13f32aeb3a680a624752a111543d8928cd6b8a243152')
b2sums=('f047a44a25563506c55b1f4dfeb591e6dbe4a0b604b18ebedec6ba852948f1c450f7a2f6afdcee78697690249958c6ec1e06d4911c19f40873fbeafb808db595')

prepare() {
  cd ${pkgname}
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd ${pkgname}
  cargo build --release --locked
}

check() {
  cd ${pkgname}
  cargo test --release --locked
}

package() {
  cd ${pkgname}
  install -Dm755 target/release/${pkgname} -t "${pkgdir}"/usr/bin
  install -Dm644 LICENSE-MIT -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
