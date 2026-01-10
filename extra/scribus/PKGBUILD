# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=scribus
pkgver=1.6.5
pkgrel=3
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
source=("https://downloads.sourceforge.net/${pkgname}/$_archive.tar.xz"{,.asc})
sha256sums=('09bdb736a8ff8a437191458a36d847cc0adeca0fc059cf696474e0ba6f59ac6a'
            'SKIP')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
    cd "$_archive"
    sed -e 's|WANT_CPP17|WANT_CPP20|g' -e 's|CMAKE_CXX_STANDARD 17|CMAKE_CXX_STANDARD 20|g' -i CMakeLists.txt
}

pkgver() {
        # People regularly flag this OOD pointing to development releases, avoid mistakenly packaging them
	if [[ $pkgver =~ ^[0-9]+\.[13579]+\.[0-9]+$ ]]; then
		echo 'Odd-numbered minor version segments indicate development versions.' >&2
		exit 1
	else
		echo "$pkgver"
	fi
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
