# Maintainer: Frederik Schwan <freswa at archlinux.org>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wit-bindgen
pkgver=0.56.0
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
sha256sums=('1eab5291acfe356cd29a5a560f157eac9c0f6dca5acb0fe1d9e1a51782d380c0')
b2sums=('1dfc1ae7b6183094fc4ff23e50671926e7d0875a2714c3070855a4b650617a09fb1421cfbdce584dfe7b8a1257f605ca6a085dc10110596c37089e43ad9d753e')

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
