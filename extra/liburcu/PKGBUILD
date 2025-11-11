# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Yggdrasil <tetzank at web dot de>

pkgname=liburcu
pkgver=0.15.4
pkgrel=1
pkgdesc="LGPLv2.1 userspace RCU (read-copy-update) library"
arch=('x86_64')
url="https://lttng.org/urcu"
license=('LGPL2.1')
depends=('glibc')
source=(https://lttng.org/files/urcu/userspace-rcu-${pkgver}.tar.bz2{,.asc})
sha256sums=('11a14a7660ac9ba9c0bbd3b2d81718523d27dc6c8a9dfabd5e401b406673ee3a'
            'SKIP')
validpgpkeys=('2A0B4ED915F2D3FA45F5B16217280A9781186ACF')

build() {
    cd "$srcdir"/userspace-rcu-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"/userspace-rcu-${pkgver}
    make install DESTDIR="$pkgdir"
}
