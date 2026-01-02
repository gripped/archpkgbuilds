# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=1.46.0
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("x86_64")
url="https://github.com/casey/just"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f60a578502d0b29eaa2a72c5b0d91390b2064dfd8d1a1291c3b2525d587fd395')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p man completions
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release
  local just="cargo run --frozen --release --"
  $just --man > "man/${pkgname}.1"
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo check --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "man/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/${pkgname}.elvish" "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
  install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
  install -Dm644 "completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
