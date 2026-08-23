# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ye Jingchen <ye.jingchen@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>

pkgname=ttf-sarasa-gothic
pkgver=1.0.41
pkgrel=1
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (TTC)"
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic"
license=('OFL-1.1')
provides=('ttf-sarasa-slab')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/Sarasa-TTC-$pkgver.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha512sums=('64871c322370763b8a5f084100897db606cb7f022bc8da52425b6dcd28e7e82c05e8e28e313268499e6c3b8f7d9bd747c2a630607b6417a6eb7abeb0965a3d1f'
            'c8de279cacb387b1d884144cc1a8d84187c775ae2d0fc98498174f155824fe1275053f407a7a3ba468496ddb89791c959cc4795c0f73715ebedf9fe95f4a4b58')

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 *.ttc "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
