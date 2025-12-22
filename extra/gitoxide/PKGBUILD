# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=gitoxide
pkgver=0.48.0
pkgrel=1
pkgdesc="An idiomatic, lean, fast & safe pure Rust implementation of Git"
url='https://github.com/Byron/gitoxide'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'cmake'
)
options=(!lto)
source=(https://github.com/Byron/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('13c1470e396c2aecaf5098a96fec3e2355c57213f1ca1c3aba3c70115f62df93')
b2sums=('0aed015bb9b2b1fc0321344e5cbc02a33ae8cfe9b44d1e7eb1f157269ed38a3ac4c48837834c0e23943b341c826b5ecc8501dcba8b2efcc50e2c44b1113a9a42')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --frozen --release --no-default-features --features max-pure
}

package() {
  cd ${pkgname}-${pkgver}

  for bin in gix ein; do
    install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${bin}"

    # install completions
    install -d "${pkgdir}/usr/share/bash-completion/completions" \
               "${pkgdir}/usr/share/zsh/site-functions" \
               "${pkgdir}/usr/share/fish/vendor_completions.d" \
               "${pkgdir}/usr/share/elvish/lib"

    "${pkgdir}/usr/bin/${bin}" completions -s bash > "${pkgdir}/usr/share/bash-completion/completions/${bin}"
    "${pkgdir}/usr/bin/${bin}" completions -s zsh > "${pkgdir}/usr/share/zsh/site-functions/_${bin}"
    "${pkgdir}/usr/bin/${bin}" completions -s fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${bin}.fish"
    "${pkgdir}/usr/bin/${bin}" completions -s elvish > "${pkgdir}/usr/share/elvish/lib/${bin}.elv"
  done

  install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
