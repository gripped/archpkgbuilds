# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=goverlay
pkgver=1.8.9
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
url="https://github.com/benjamimgois/goverlay"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glu' 'qt6pas' 'mangohud' '7zip' 'wget' 'fontconfig' 'sdl2-compat' 'ttf-font-nerd')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'vkbasalt: Configure vkBasalt'
            'git: Clone reshade repository')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz")
sha256sums=('bc881c3bc0ee7f608148ccc4f488055d256a1af6bb4a37520c21dd203b3c5d22')

build() {
	cd "${pkgname}-${_pkgver}"
	make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
	cd "${pkgname}-${_pkgver}"
	make tests
}

package() {
	cd "${pkgname}-${_pkgver}"
	make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
	ln -s /usr/lib/pascube "${pkgdir}/usr/bin/"
}
