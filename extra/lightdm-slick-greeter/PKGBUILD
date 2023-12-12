# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter
pkgver=2.0.1
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
sha512sums=('e56bd4c7bc06ae12363328a00bb54e4e8f306e37e4d56d86ae1d232cf4f1a80e0edd256d526e13b0a43b3c9adfc610a4539cd43e22ab3a34774e9546610bd56c')
b2sums=('411c1c460a16b3dfe3f04e5b5c90feca41e4d934195c3139bf66f9ae6a86e371844e510d578958672a8829ca8c4991129109be5c2dac2424dc31218b290e0829')

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
