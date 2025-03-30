# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: John Gerritse <john.gerritse@gmail.com>

pkgname=atop
pkgver=2.11.1
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
sha512sums=('6c3301ecc7fa261bc9f9a9d285315b048aa56fdf94629b1e4ad2634b0cf048d70afe7813b1a44506756d6af05b8b78df76df995aa6f4c404bf01fd6225839a3d'
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
