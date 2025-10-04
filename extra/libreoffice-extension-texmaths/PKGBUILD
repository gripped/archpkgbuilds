# Maintainer: Antonio Rojas < arojas@archlinux.org >

pkgname=libreoffice-extension-texmaths
_extname=texmaths
pkgver=0.52.4
pkgrel=1
pkgdesc='A LaTeX equation editor for LibreOffice'
arch=(any)
url='http://roland65.free.fr/texmaths/'
license=(GPL2)
depends=(libreoffice
         texlive-basic)
source=(https://downloads.sourceforge.net/project/$_extname/$pkgver/TexMaths-$pkgver.oxt)
sha256sums=('40d26e5690c8cddc6dbc0eecf65f3a956b57701342f4513db4ad2aa2dcbda715')

package() {
  install -d -m755 "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname

  cp -r * "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname
  rm "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname/*.oxt
}
