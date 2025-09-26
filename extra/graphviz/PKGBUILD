# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=14.0.0
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
sha256sums=('ff40891d521a680d109d77e2c6fe172173c4b63c59c5dd526d599d7af62cf290')
b2sums=('f543342ed70dfbf9ce1aa9bcc3353f3ceaf4e8c8c39347dbf2b7bcb2b7ed59c664160ba9da84dca1cb39c78e85d1efd007021b5e4f3ade972cdd549e1be18b82')
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
