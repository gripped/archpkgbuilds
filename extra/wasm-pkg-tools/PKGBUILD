# Maintainer: Frederik Schwan <freswa at archlinux.org>

pkgname=wasm-pkg-tools
pkgver=0.16.0
pkgrel=1
pkgdesc="Tools to package up Wasm Components"
url="https://github.com/bytecodealliance/wasm-pkg-tools"
arch=('x86_64')
license=('MIT')
depends=(
  cargo
  glibc
  libgcc
)
makedepends=(
  git
)
options=(!lto)
source=("git+https://github.com/bytecodealliance/wasm-pkg-tools.git#tag=v${pkgver}")
sha256sums=('d748e9f1a8c6b5deb384c065df18504d04beadcefd26a25d66aed1596d3a7a4c')
b2sums=('9e97d3acc3f9283c2f0f1be83d71f412b0894a1de1073927b675dfa3c7151c072c566d6cadbcf27427880992175cd82e28ec4b5d57af377e611eb2cc3b04d4a6')

prepare() {
  cd ${pkgname}
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd ${pkgname}
  cargo build --release --locked
}

package() {
  cd ${pkgname}
  install -Dm755 target/release/wkg -t "${pkgdir}"/usr/bin
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
