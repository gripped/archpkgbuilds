# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-twm
pkgver=1.0.13
pkgrel=1
pkgdesc="Tab Window Manager for the X Window System"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
backup=(usr/share/X11/twm/system.twmrc)
license=('LicenseRef-twm')
depends=('libxmu' 'libxext' 'libxt' 'libx11' 'libsm' 'libice' 'glibc')
makedepends=('xorg-util-macros')
options=('!emptydirs')
source=(${url}/releases/individual/app/twm-${pkgver}.tar.xz{,.sig})
sha512sums=('bab61865b798869d64fdf6e65ac9affee7ae0acf5523e4dc36e5fc65664ed83fb6ba8f1f7f495c29340e9e3dd00a386a81dcccfa11fc7adf3edda505db2f52b9'
            'SKIP')
# validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03') # Thomas E. Dickey (use for email)<dickey@his.com>

build() {
  cd twm-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd twm-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
