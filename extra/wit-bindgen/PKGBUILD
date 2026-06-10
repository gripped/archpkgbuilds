# Maintainer: Frederik Schwan <freswa at archlinux.org>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wit-bindgen
pkgver=0.58.0
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
sha256sums=('bb3216095ffa57e2334e05d25ad312ee33c4da993f9cfe061062236ba0306b79')
b2sums=('f44d60c9cb2e8f4100b7c958067a2a8dd467a58343f8e16bda2779d69c6a3f2f8a681cf54421b8edeccb9f6e927336bd32cff0ad18a1bb373977c9a89d8ad440')

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
