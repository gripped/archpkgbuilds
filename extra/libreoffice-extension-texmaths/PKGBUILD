# Maintainer: Antonio Rojas < arojas@archlinux.org >

pkgname=libreoffice-extension-texmaths
_extname=texmaths
pkgver=0.52.2
pkgrel=1
pkgdesc='A LaTeX equation editor for LibreOffice'
arch=(any)
url='http://roland65.free.fr/texmaths/'
license=(GPL2)
depends=(libreoffice
         texlive-basic)
source=(https://downloads.sourceforge.net/project/$_extname/$pkgver/TexMaths-$pkgver.oxt)
sha256sums=('e2633cb08808e7b5e412649b1bf6e19381f7564152775f15fc66308f2f429789')

package() {
  install -d -m755 "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname

  cp -r * "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname
  rm "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname/*.oxt
}
