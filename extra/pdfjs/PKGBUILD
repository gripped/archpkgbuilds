# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pdfjs
pkgver=6.5.438
pkgrel=1
pkgdesc="PDF reader in javascript"
conflicts=(pdfjs-legacy)
arch=('any')
url="https://mozilla.github.io/pdf.js/"
license=('Apache-2.0')
source=("https://github.com/mozilla/pdf.js/releases/download/v${pkgver}/pdfjs-${pkgver}-dist.zip")
sha256sums=('fcbe9ba21d9911843e3502adc178a7f549a524a4055f887bedc942e5490c6ba1')

package() {
  mkdir -p "$pkgdir/usr/share/pdf.js"
  cp -R "$srcdir"/{LICENSE,build,web} "$pkgdir/usr/share/pdf.js"
  find "$pkgdir" -type f -exec chmod 644 {} \;  
}
