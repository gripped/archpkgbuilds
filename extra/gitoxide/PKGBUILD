# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=gitoxide
pkgver=0.52.1
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
sha256sums=('47eeb05374986e6a3fd174d364ca6699bdc58966f091ff8ab14792a87629c499')
b2sums=('dccd291fefd25e48ccb82cbe6bbfa1391748fbc1edc2b9fe6fd78631b76527c656ead3b12f45442d6c720fed0f1ff150080323205579350587faf98c61b0ba82')

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
