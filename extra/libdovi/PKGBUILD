# Maintainer: Maxime Gauduin <alucryd@archlinux>org>
# Contributor: quietvoid <tcChlisop0@gmail.com>

pkgname=libdovi
pkgver=3.3.2
pkgrel=2
pkgdesc='Library to read and write Dolby Vision metadata'
arch=(x86_64)
url=https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision
license=(MIT)
depends=(
  glibc
  libgcc
)
makedepends=(
  cargo-c
  git
  rust
)
provides=(libdovi.so)
source=(git+https://github.com/quietvoid/dovi_tool.git#tag=libdovi-${pkgver})
b2sums=('40aefc4476b3fb674d2f2fe241de1e8e8b91658c8d5c9d7c729d371bbbb5b70955210d23b3cd088ae2001963f9aa15c29ceb4fa3abf15762f66d44efd6c3ae0e')

prepare() {
  cargo fetch \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

build() {
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo cbuild \
    --release \
    --frozen \
    --prefix=/usr \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --all-features \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

package() {
  cd dovi_tool/dolby_vision
  cargo cinstall \
    --release \
    --frozen \
    --prefix /usr \
    --destdir "${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/libdovi/
}
