# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hexchain Tong <i@hexchain.org>

pkgname=ttf-opensans
pkgver=1.101
pkgrel=5
pkgdesc='Sans-serif typeface commissioned by Google'
arch=('any')
url='https://fonts.google.com/specimen/Open+Sans'
license=('Apache')

_commit='66f91f10f8e8590367c541bcb5adbe66c933f15f'
_raw="https://github.com/google/fonts/raw/${_commit}/ofl/opensans"

source=(
    # OpenSans-Italic[wdth,wght].ttf
    "OpenSans-Italic.ttf::${_raw}/OpenSans-Italic%5Bwdth,wght%5D.ttf"
    # OpenSans[wdth,wght].ttf
    "OpenSans.ttf::${_raw}/OpenSans%5Bwdth%2Cwght%5D.ttf"
)

sha256sums=('fe269381e992f32e135801740998544d6235061e37c93ec067ad2be3edd5b17b'
            '36643644f318a812aab2d2ed3bb98f8cf0872527f835fe9398d95fe6b9adb878')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
