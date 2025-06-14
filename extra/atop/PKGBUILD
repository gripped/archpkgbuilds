# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: John Gerritse <john.gerritse@gmail.com>

pkgname=atop
pkgver=2.12.0
pkgrel=1
pkgdesc='A system and process level monitor'
arch=('x86_64')
url='https://www.atoptool.nl/'
license=('GPL')
depends=('ncurses' 'sh' 'zlib')
optdepends=(
    'python-pynvml: NVIDIA gpu reporting AUR'
)
backup=('etc/default/atop')
source=("https://www.atoptool.nl/download/atop-${pkgver/_/-}.tar.gz"
        'atop.default')
sha512sums=('d0cee89b6d187b853726d025ddedb067a91aa4b71195e125d2a4a2d9057acd149b92f48a5d633729e36634c70d60334ce72f73ef8051861ba4c7e482e17cd5ff'
            '3583738b48d9b5ed1ada323a753cd30bfd41a118d7f96ab9f536858ac356cdd5dd2acf30de5c000745c0b817e9e0ee115731fbe9828086488c3c9df773a05d08')

#prepare() {
    #cd "$pkgname-$pkgver"
    #patch -p1 -i "$srcdir/262.patch"
#}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    ## default folder not properly created
    mkdir -p "$pkgdir/etc/default"
    make DESTDIR="$pkgdir" install \
        SBINPATH=/usr/bin \
        SYSDPATH=/usr/lib/systemd/system
    install -Dm644 "$srcdir/atop.default" "$pkgdir/etc/default/atop"
    # enable atop-rotate.timer by default
    install -dm755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
    ln -s ../atop-rotate.timer \
        "$pkgdir/usr/lib/systemd/system/timers.target.wants/atop-rotate.timer"
}
