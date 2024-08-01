# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tdb
pkgver=1.4.11
pkgrel=1
pkgdesc='Trivial Database similar to GDBM but allows simultaneous commits'
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://tdb.samba.org/"
depends=('glibc')
makedepends=('python' 'libxslt' 'docbook-xsl')
optdepends=('python: for python bindings')
provides=(libtdb.so)
source=(https://samba.org/ftp/${pkgname}/${pkgname}-${pkgver}.tar{.gz,.asc})
validpgpkeys=('9147A339719518EE9011BCB54793916113084025') # Samba Library Distribution Key <samba-bugs@samba.org>
sha512sums=('96883e3c32439a69239846904ae2718561b0c57149ac729c5b188f2615e1eb51578df56498f7b6239adea1663861d8c47790ce65e2d4d75130b41704b86b81b8'
            'SKIP')

build() {
   cd ${pkgname}-${pkgver}
   ./configure --prefix=/usr \
               --localstatedir=/var \
               --sysconfdir=/etc/samba
   make
}

package() {
   cd ${pkgname}-${pkgver}
   make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
