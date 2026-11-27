# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=openipmi
_pkgname=OpenIPMI
pkgver=2.0.38
pkgrel=1
pkgdesc='Full-function IPMI (Intelligent Platform Management Interface) system'
url='http://openipmi.sourceforge.net/'
arch=('x86_64')
license=('LGPL2.1')
makedepends=('python' 'swig')
depends=('popt' 'ncurses' 'net-snmp' 'glib2' 'gdbm' 'libedit')
optdepends=('python: bindings')
source=("https://downloads.sourceforge.net/project/${pkgname}/${_pkgname}%202.0%20Library/${_pkgname}-${pkgver}.tar.gz"
         swig-4.5.patch)
sha512sums=('cbfe63563855cfddda7811a20803bdc28b565cb4e8f32b06eb3a1096f39df10273735063e3b94b19768308e77d2a6e01c1d5b8412034c818add5ed4ba5fd9745'
            'a2df73f76a26edbe2c5ef6a414154de3dd74b0623e84190c23b4cfae6ef0e104af47491774b4276e22cf673a2d225dfda4834eefa582a97b92bff9b68b99c9df')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed \
		-e '/Requires:/s/pthread//' \
		-e '/Libs:/s/$/ -lpthread/' \
		-i OpenIPMIpthread.pc.in
	patch -p1 -i ../swig-4.5.patch
	# Upstream dropped ChangeLog in 2.0.38, but automake still runs in GNU mode.
	touch ChangeLog
	autoreconf -fiv
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
