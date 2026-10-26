# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ye Jingchen <ye.jingchen@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>

pkgname=ttf-sarasa-gothic
pkgver=1.0.43
pkgrel=1
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (TTC)"
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic"
license=('OFL-1.1')
provides=('ttf-sarasa-slab')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/Sarasa-TTC-$pkgver.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha512sums=('c84944813c5640a3e2decd4082f818eb7c156f766125dd20c5716c2026042ae31a870136aac5fcd4fba89f14cc7e6ddec42c3a158396964c4fdde0a6ef4e0195'
            'c8de279cacb387b1d884144cc1a8d84187c775ae2d0fc98498174f155824fe1275053f407a7a3ba468496ddb89791c959cc4795c0f73715ebedf9fe95f4a4b58')

# Enable long distance matching to find distant repetitions
COMPRESSZST+=(--long)

package() {
    install -Dm644 *.ttc -t "$pkgdir/usr/share/fonts/${pkgname:4}/"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
