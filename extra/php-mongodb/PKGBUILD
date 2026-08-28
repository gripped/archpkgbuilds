# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Martin Striz < ms AT martinstriz DOT cz >
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgbase=php-mongodb
pkgname=(php-mongodb php-legacy-mongodb)
pkgver=2.4.1
pkgrel=1
pkgdesc="MongoDB driver for PHP"
arch=("x86_64")
url="https://pecl.php.net/package/mongodb"
license=("Apache-2.0")
makedepends=('php-legacy' 'php' 're2c')
source=(
	"https://pecl.php.net/get/mongodb-$pkgver.tgz"
	"mongodb.ini"
)
sha512sums=('74c67a6a9d74a6c3d899f491e4b191d04120537c690f4507e53aeba2b093b985088b40c14c6bfb182ca0ee9a288e81cc5d3194b2ee83b4adee4d0618d478e80b'
            '47b167ab4d761f4cf8351fef14e46c714dacae6d9a1b6d281bb87129499ee520f55f35f47c16b55ea2ecf41c67aad12439a99d3363d381b2511659b01f0b6ef0')

prepare() {
    cp -a "$srcdir/mongodb-$pkgver" "$srcdir/mongodb-legacy-$pkgver"
}

build() {
    cd "$srcdir/mongodb-$pkgver"
    phpize
    ./configure --prefix=/usr

    cd "$srcdir/mongodb-legacy-$pkgver"
    phpize-legacy
    ./configure --prefix=/usr
}

package_php-mongodb() {
    pkgdesc="MongoDB driver for PHP"
    depends=('php')
    backup=("etc/php/conf.d/mongodb.ini")
    cd mongodb-$pkgver
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 "$srcdir/mongodb.ini" "$pkgdir/etc/php/conf.d/mongodb.ini"
}

package_php-legacy-mongodb() {
    pkgdesc="MongoDB driver for PHP Legacy"
    depends=('php-legacy')
    backup=("etc/php-legacy/conf.d/mongodb.ini")
    cd mongodb-legacy-$pkgver
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 "$srcdir/mongodb.ini" "$pkgdir/etc/php-legacy/conf.d/mongodb.ini"
}
