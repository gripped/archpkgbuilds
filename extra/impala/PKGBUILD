# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=impala
pkgver=0.7.4
pkgrel=1
pkgdesc="TUI for managing wifi"
url="https://github.com/pythops/impala"
depends=('gcc-libs' 'glibc' 'iwd')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0be049baee571b4e3a44864813828aed138d31ef657fa2ccae8b918b622329ac228b35e1130bfc70311bf00c6962b3fb3fc79156593cb0116fb232537f1f30be')

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
