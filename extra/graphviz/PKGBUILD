# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=14.1.2
pkgrel=1
pkgdesc='Graph visualization software'
url='https://www.graphviz.org/'
license=('EPL')
arch=('x86_64')
depends=('libltdl' 'gd' 'librsvg' 'ghostscript' 'pango' 'gts' 'gsfonts')
makedepends=('swig' 'mono' 'guile' 'lua' 'perl' 'python' 'r' 'tk' 'qt6-base')
optdepends=('mono: sharp bindings'
            'guile: guile bindings'
            'lua: lua bindings'
            'perl: perl bindings'
            'python: python bindings'
            'r: r bindings'
            'tcl: tcl bindings'
            'qt6-base: gvedit'
            'xterm: vimdot')
source=("https://gitlab.com/graphviz/graphviz/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('44fb98203b4545421a2c2cbeb917a8443388838e22460e164526dda3aa28d892')
b2sums=('06bc4cc5be5d0ae98c555c98415717801e76dd2dde069c09c3dd114516daf53752351cfca19d1cba96c979b9261e5c95c8e2edede4675890f704915647056bd0')
install='graphviz.install'

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh NOCONFIG
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export LIBPOSTFIX=/
	export CXXFLAGS+=' -fPIC -fpermissive'

	./configure --prefix=/usr --enable-python3=yes --disable-python --enable-lefty
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# fix symlink to symlink that doesn't get picked up by makepkg's zipman
	ln -s gv2gxl.1.gz "${pkgdir}"/usr/share/man/man1/dot2gxl.1.gz
	rm "${pkgdir}"/usr/share/man/man1/dot2gxl.1

	# Deduplicates TCL libraries
	cd "${pkgdir}/usr/lib/tcl8.6"
	rm -fr graphviz
	ln -s ../graphviz/tcl graphviz
}
