# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=gitoxide
pkgver=0.53.0
pkgrel=1
pkgdesc="An idiomatic, lean, fast & safe pure Rust implementation of Git"
url='https://github.com/Byron/gitoxide'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'cargo'
  'cmake'
)
options=(!lto)
source=(https://github.com/Byron/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('81d99c6b60cc93a01dc7539c310e3e8737fe88dd86ee8887cf203ba7b76aca59')
b2sums=('b13e2dbff7859a670d4005bd3b8f65015142b65793e40778280d1c3f77566e456feb364c518812447a117b7b03ca335be9b7cb216a1d57b28fdbd2965770b8eb')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target host-tuple
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
