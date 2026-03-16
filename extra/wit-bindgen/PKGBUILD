# Maintainer: Frederik Schwan <freswa at archlinux.org>

pkgname=wit-bindgen
pkgver=0.54.0
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
sha256sums=('ec100c95baec1e8f7791785e196f76bf4295cbe19054d340051dad0185bfbddb')
b2sums=('2b83bb2a1f241dd20ce9fabd2313b80c830756d930b89a8b3791772a289a90041886c15108e32dfc9a0d20d6f28c41d27ac9bba8634b1100f579f9ded9644729')

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
