# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=impala
pkgver=0.8.0
pkgrel=1
pkgdesc="TUI for managing wifi"
url="https://github.com/pythops/impala"
depends=(
  'libgcc'
  'glibc'
  'iwd'
)
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('44ea4e289cbbbfdcffea26f23496bf32136b4aa471013520f2ad654d57c1a9c2f9f4b7cebfdb4aa89c8d743becddfdab01c276d6b3515bf2848ea422ac6fb89c')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
