# Maintainer: Frederik Schwan <freswa at archlinux.org>

pkgname=wasm-pkg-tools
pkgver=0.16.2
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
sha256sums=('f5aa42cab50d0f793ae5da4a7524426928feadcb8545790c7b5a606294df22b7')
b2sums=('0bab33b11971ef7a708e4c907651540162d53ebade7bb4cabea05518366dd86f9e0fe780808ec26cc2d5a4df6e132bbc7c1a21904c6c94ebfe79ad6f62ecde9b')

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
