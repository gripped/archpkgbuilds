# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=ttf-roboto
pkgver=3.010
pkgrel=1
pkgdesc="Google's signature family of fonts"
url='https://github.com/googlefonts/roboto-3-classic'
arch=('any')
license=('OFL-1.1')
source=(
  "$url/releases/download/v$pkgver/Roboto_v$pkgver.zip"
  "$pkgname-$pkgver-OFL.txt::https://raw.githubusercontent.com/googlefonts/roboto-3-classic/v$pkgver/OFL.txt"
)
sha256sums=('173f6d2fdd7e523f189ccf04507f72d900e88cd18332a86f4e33afb3bd78dc30'
            '061402327a96aadb0bfb694a960ed289ecd38d383e396243831ab81feb109c41')

package() {
  install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" \
    Roboto_v$pkgver/hinted/static/*.ttf
  install -vDm644 $pkgname-$pkgver-OFL.txt \
    "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
