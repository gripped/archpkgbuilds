# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=gitoxide
pkgver=0.50.0
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
sha256sums=('8ad0fdcfa465fedac7c4bafaae2349ad0db7daf48a80d9cb2bd70dd36fa567aa')
b2sums=('4de88ee39703b155c3d34684b4b5d535a90b6bf033b8ba0b499c70eae554aa8c683a3834785c7076426f8c3b627c2430af1fad3c1088103635beb81ffa9989de')

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
