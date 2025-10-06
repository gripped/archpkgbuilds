# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=14.0.1
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
sha256sums=('a969b754ecd9e25cc93b2d299cc03f573ff65c5d3595350fa22678c028b8de52')
b2sums=('b6256897af52354d0d0d201ccb99a50fccfbc7487680b2db8627dea9783a6495921dd2b5d1dab5b771b7a0160792ef1bb61fa99f0e9684d0b7a852a0a50fc581')
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
