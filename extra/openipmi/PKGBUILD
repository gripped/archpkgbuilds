# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=openipmi
_pkgname=OpenIPMI
pkgver=2.0.36
pkgrel=3
pkgdesc='Full-function IPMI (Intelligent Platform Management Interface) system'
url='http://openipmi.sourceforge.net/'
arch=('x86_64')
license=('LGPL2.1')
makedepends=('python' 'swig')
depends=('popt' 'ncurses' 'net-snmp' 'glib2' 'gdbm' 'libedit')
optdepends=('python: bindings')
source=("https://downloads.sourceforge.net/project/${pkgname}/${_pkgname}%202.0%20Library/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a47725308336f200e88a1eb8641ed5ef03fc8bb43ee47f7a99e39df68640ff912b6842c1710d7e767aeb724fc41fa4ed3b244685812ee985e5200003a45f4015')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed \
		-e '/Requires:/s/pthread//' \
		-e '/Libs:/s/$/ -lpthread/' \
		-i OpenIPMIpthread.pc.in
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	PYTHONWARNINGS=ignore ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install-exec
	make DESTDIR="${pkgdir}" install
	install -Dm644 doc/IPMI.pdf "${pkgdir}/usr/share/doc/${pkgname}/IPMI.pdf"
}
