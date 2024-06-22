# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter
pkgver=2.0.5
pkgrel=1
pkgdesc='A slick-looking LightDM greeter'
arch=('x86_64')
url="https://github.com/linuxmint/slick-greeter"
license=('GPL3')
depends=('cairo' 'freetype2' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman'
         'python' 'xorg-server' 'xapp')
optdepends=('numlockx: enable numerical keypad on supported keyboard')
makedepends=('intltool' 'vala' 'gnome-common')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('394f226e0bd78b317979dcfb76546af3dc4337104887d88d1688a88e7d3d18f23b915cf861f9254d404f075e12c3aeda87ac2a49a4d6255b9b50cb0d15ac6c7a')
b2sums=('6be08aeea22f8acab3fee364b3bd4c1edd5ec109bd13826a16950d9962f91f08f384415f978d187ff92a7ba76fd7c11bae91d7e2ef578c2fb70e6f3334a7490b')

prepare() {
	cd slick-greeter-${pkgver}
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd slick-greeter-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin \
             --libexecdir=/usr/lib/lightdm
	make
}

package() {
	cd slick-greeter-${pkgver}
	make DESTDIR="${pkgdir}" install
	# adjust launcher name
	mv $pkgdir/usr/share/xgreeters/slick-greeter.desktop \
    $pkgdir/usr/share/xgreeters/lightdm-slick-greeter.desktop
}
