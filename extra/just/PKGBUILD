# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=1.56.0
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=(x86_64)
url="https://github.com/casey/just"
license=(CC0-1.0)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('145cb76ccd858da30ee56de884dad9241b2706140bcf9ae189dfda5e5a62ed52')

_srcenv() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
}

prepare() {
  _srcenv
  cargo fetch --locked --target host-tuple
  mkdir -p man completions
}

build() {
  _srcenv
  cargo build --frozen --release
  local just="cargo run --frozen --release --"
  $just --man > "man/${pkgname}.1"
}

check() {
  _srcenv
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
