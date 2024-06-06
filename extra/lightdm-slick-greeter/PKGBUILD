# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter
pkgver=2.0.4
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
sha512sums=('e3362b03abe58f76c43644f4638352ab1e934137a4efa1fe6dd7c7c7e40935fbc10c33c1daa432f2bccf0af0b2c141d53581171e01c2cc71a2eaab8aa1ac74d2')
b2sums=('275fdef11fe55656a05c2e5abfb17fcc19ef7fc992a004ba5eb339ccd6bba7e7a3d4f49d066150f5a2ad339cdde9352663429d07f557964a7f1d438d36addec8')

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
