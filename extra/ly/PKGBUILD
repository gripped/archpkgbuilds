# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: éclairevoyant
# Contributor: nullgemm <nullgemm@mailbox.org>

pkgname=ly
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI display manager"
arch=(x86_64)
url="https://github.com/fairyglade/ly"
license=('WTFPL')
depends=(pam glibc)
makedepends=(git libxcb zig)
optdepends=('xorg-xauth: for X server sessions'
            'libxcb: for X server sessions')
backup=(etc/$pkgname/{config.ini,wsetup.sh,xsetup.sh})
source=("git+$url.git#tag=v${pkgver}")
b2sums=('b44536c57e3464ffbb45d12cee54bad00b5eb31873fdd79c81222640ecab5df34b9a587232e5db760561f3f2d33af872456d3a3b92ef2a414b8dbf4fc6a70725')

prepare() {
    cd "$pkgname"
    git cherry-pick -n cbe7b37564f307fddfeba3732c68d5024d30f4f7
}

build() {
    cd "$pkgname"
    zig build
}

package() {
    cd "$pkgname"
    zig build -Ddest_directory="$pkgdir" -Dname="ly-dm" installsystemd
    # https://github.com/fairyglade/ly/issues/628
    chmod 644 "$pkgdir/etc/pam.d/ly" "$pkgdir/usr/lib/systemd/system/ly.service"
    sed -i "s;/usr/bin/ly;/usr/bin/ly-dm;g" "$pkgdir/usr/lib/systemd/system/ly.service"

    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}
