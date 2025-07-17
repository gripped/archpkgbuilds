# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=spotify-launcher
pkgver=0.6.3
pkgrel=2
pkgdesc="Client for spotify's apt repository in Rust for Arch Linux"
url='https://github.com/kpcyrd/spotify-launcher'
arch=('x86_64')
license=('Apache-2.0' 'MIT')
depends=(
  'alsa-lib>=1.0.14'
  'at-spi2-atk'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libcurl-gnutls'
  'libsm'
  'libxss'
  'nss'
  'sequoia-sqv'
  'xz' 'liblzma.so'
  'zenity'
)
makedepends=('cargo')
backup=('etc/spotify-launcher.conf')
source=(https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/kpcyrd/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha256sums=('2f94319ecd59d6129b2124262a1155a56a40601c452b5099a5b59bf17c7b1c27'
            'SKIP')
b2sums=('4db34a37e3ef93f85f07b1ad6572835206fe07bc66933af773556bd40511adbd26b5014b876789ef9a1102fd0972c500aaa92f18b230b478351118ac3d32897a'
        'SKIP')
options=('!lto')

validpgpkeys=("64B13F7117D6E07D661BBCE0FE763A64F5E54FD6")

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/spotify-launcher
  install -Dm 644 data/pubkey_C85668DF69375001.gpg \
    "${pkgdir}/usr/share/spotify-launcher/keyring.pgp"

  install -Dm644 contrib/spotify-launcher.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 contrib/icons/spotify-linux-512.png "${pkgdir}/usr/share/pixmaps/spotify-launcher.png"
  install -Dm644 contrib/spotify-launcher.conf -t "${pkgdir}/etc"
  install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"

  for size in 22 24 32 48 64 128 256 512; do
    install -Dm644 "contrib/icons/spotify-linux-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify-launcher.png"
  done
}

# vim: ts=2 sw=2 et:
