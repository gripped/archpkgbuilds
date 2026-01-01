# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=gitoxide
pkgver=0.49.0
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
sha256sums=('190d8708ddcd27ca6c1df264286a1115343bc324d210f07eeadcc3a110abfa8c')
b2sums=('e3adfdf3550b80f468bc60332fccaa53fcada2e6765c551727402aff69e7a9b14590d317477146063868e81c3639d5527f13ef663a038e2f9bb8de7c81e1e875')

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
