# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=impala
pkgver=0.8.1
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
sha512sums=('f6ced2449c69e6814246335ca505807544c66309fb55b4ea5fd31f5f47563cf72a3c49bbcc807e212cb72b403102968871570d44c350079980a40b9b87cb4850')

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
