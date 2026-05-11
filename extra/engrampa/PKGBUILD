# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=engrampa
pkgver=1.28.3
pkgrel=1
pkgdesc="A file archiver for MATE"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('gtk3' 'gzip' 'gettext' 'libarchive' 'tar' 'unzip' 'zip')
makedepends=('autoconf-archive' 'caja' 'git' 'glib2-devel' 'itstool' 'mate-common' 'python' 'yelp-tools')
optdepends=('caja: Caja support'
            'p7zip: 7Z and ARJ archive support'
            'unace: ACE archive support'
            'unrar: RAR archive support'
            'brotli: Brotli compression support'
            'rpm-tools: RPM support'
            'cpio: RPM support')
groups=('mate-extra')
conflicts=("engrampa-gtk3")
replaces=("engrampa-gtk3")
source=("git+https://github.com/mate-desktop/engrampa.git#tag=v${pkgver}"
        git+https://github.com/mate-desktop/mate-submodules.git)
sha256sums=('4b8dc4b73dd080a7e13cb168f8de4fb7278b25b3bdd18a1b2b943a305ddb4853'
            'SKIP')

prepare() {
	cd "${pkgname}"
	git submodule init
	git config submodule.mate-submodules.url "${srcdir}/mate-submodules"
	git -c protocol.file.allow=always submodule update
	./autogen.sh
}

build() {
	cd "${pkgname}"
    	./configure \
        	--prefix=/usr \
		--libexecdir="/usr/lib/${pkgname}" \
        	--disable-packagekit
    	make
}

package() {
	cd "${pkgname}"
    	make DESTDIR="${pkgdir}" install
}
