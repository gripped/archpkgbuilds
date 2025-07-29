# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=13.1.1
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
sha256sums=('2183297bc5030951fed6c0511b39712057126d2098baa02fd914b09b5a19b820')
b2sums=('60bb8fcb3e66fc34bbc11506cf55ac99f918388bd81a3df4a6017a7a24715cbf61304af3eefc297771648f6dc66f47a801bb3ecfb1b386d1f281f1d59d73c47b')
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
