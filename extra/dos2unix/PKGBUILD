# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Bartłomiej Piotrowski
# Contributor: Renato Garcia <fgar.renatoATgmailDOTcom>
# Contributor: Gerson E. Ruotolo <gersonruotolo@globo.com>

pkgname=dos2unix
pkgver=7.5.5
pkgrel=1
pkgdesc='Text file format converter'
arch=('x86_64')
url='https://waterlan.home.xs4all.nl/dos2unix.html'
license=('BSD')
depends=('glibc')
makedepends=('git' 'perl' 'perl-pod-parser' 'po4a')
conflicts=('hd2u')
source=(git+https://git.code.sf.net/p/dos2unix/dos2unix.git#tag=${pkgname}-${pkgver})
sha256sums=('8acb99908d09a934d8b02a845d57121dcdfdc24705144031b727029c085bf4dc')
#validpgpkeys=('F8F1BEA490496A09CCA328CC38C1F572B12725BE')

build() {
  cd $pkgname/dos2unix
  make LDFLAGS_USER="${LDFLAGS}"
}

package() {
  cd $pkgname/dos2unix

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
