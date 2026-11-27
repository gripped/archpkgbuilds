# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers
pkgver=1.5.3
pkgrel=2
pkgdesc='Header files for AMD Advanced Media Framework'
arch=(any)
url=https://github.com/GPUOpen-LibrariesAndSDKs/AMF/
license=(MIT)
makedepends=(git)
source=(git+https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git#tag=v${pkgver})
b2sums=('aafa04d7054d385d93c434c9d8106ca4291116b3ce2fb95063829b57a5c00d59593d67d7aa952efcd7c3307d100660de8e530e8c06150a586b6713d841033094')

package() {
  install -dm 755 "${pkgdir}"/usr/include
  cp -dr --no-preserve=ownership AMF/amf/public/include "${pkgdir}"/usr/include/AMF
  install -Dm 644 AMF/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/amf-headers/
}
