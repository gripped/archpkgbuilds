# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=scribus
pkgver=1.6.2
pkgrel=8
pkgdesc="Desktop publishing software"
arch=(x86_64)
url="https://www.scribus.net/"
license=(GPL-2.0-or-later)
depends=(cairo
         fontconfig
         freetype2
         harfbuzz-icu
         hunspell
         icu libicuuc.so
         lcms2
         libcdr
         libcups
         libfreehand
         libjpeg-turbo libjpeg.so
         libmspub
         libpagemaker
         libpng
         libqxp
         librevenge
         libtiff
         libvisio
         libxml2
         libzmf
         openscenegraph
         openssl
         podofo
         poppler
         python3
         qt5-base
         zlib) # graphicsmagick
makedepends=(cmake
             mesa
             qt5-tools)
optdepends=('gdal: enable gdal plugin'
            'hyphen-lang: hyphenation patterns for desired languages'
            'tk: scripts based on tkinter')
options=(!lto)
_archive="$pkgname-$pkgver"
source=("https://downloads.sourceforge.net/${pkgname}/$_archive.tar.xz"{,.asc}
        fix_build_with_poppler_24.12.0.patch
        fix_build_with_poppler_25.01.0.patch)
sha256sums=('7eff9b1f47e372e56bb369f1dbe18fe49101789b5e6bcfdb7890e0346b641383'
            'SKIP'
            '69b060bb880a9681fe6223fbc9f94f848a7eb71199efcf36dc8974c94fadeb2d'
            '152265e6d4af88b41552020d273b40947255b0ee13b355c1b4d52922428b06a8')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
    cd "$_archive"
    sed -e 's|WANT_CPP17|WANT_CPP20|g' -e 's|CMAKE_CXX_STANDARD 17|CMAKE_CXX_STANDARD 20|g' -i CMakeLists.txt

    # Temporary patch to fix build with poppler 24.12.0
    # See https://github.com/scribusproject/scribus/commit/c9490423c8d4819ecb35af7b7f2cad581b5219da
    # And https://github.com/scribusproject/scribus/commit/16b660d4d2a7f4cb4cb7775f72ec026197278838
    # And https://github.com/scribusproject/scribus/commit/44745297bd70a25b1d88ed922bdcb2d90a2fb435
    patch -Np1 < "$srcdir/fix_build_with_poppler_24.12.0.patch"
    patch -Np1 < "$srcdir/fix_build_with_poppler_25.01.0.patch"
}

build() {
	cmake -B build -S "$_archive" \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_SKIP_RPATH=On \
		-D WANT_CPP20=On \
		-D WANT_HUNSPELL=On \
		-D WITH_PODOFO=On \
		-D WANT_GRAPHICSMAGICK=On
	make -C build
}

package() {
	make -C build DESTDIR="${pkgdir}" install
	cd "$_archive"
	install -Dm0644 scribus.desktop -t "$pkgdir/usr/share/applications"
	pushd resources/iconsets/artwork
	for i in 16x16 32x32 128x128 256x256 512x512 1024x1024; do
		install -Dm0644 icon_$i.png "$pkgdir/usr/share/icons/hicolor/$i/apps/scribus.png"
	done
	# Use system hyphen
	rm -rf "$pkgdir/usr/share/scribus/dicts/hyph"
	ln -sf /usr/share/hyphen "$pkgdir/usr/share/scribus/dicts/hyph"
}
