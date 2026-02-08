# Maintainer: Antonio Rojas < arojas@archlinux.org >

pkgname=libreoffice-extension-texmaths
_extname=texmaths
pkgver=0.52.5
pkgrel=1
pkgdesc='A LaTeX equation editor for LibreOffice'
arch=(any)
url='http://roland65.free.fr/texmaths/'
license=(GPL-2.0-or-later)
depends=(libreoffice
         texlive-basic)
source=(https://downloads.sourceforge.net/project/$_extname/$pkgver/TexMaths-$pkgver.oxt)
sha256sums=('e10ae08e2067f3737751c9126033b82ba1e38239a72549e7a9627643a2429649')

package() {
  install -d -m755 "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname

  cp -r * "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname
  rm "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname/*.oxt
}
