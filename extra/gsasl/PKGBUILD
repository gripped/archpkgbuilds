# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl
pkgver=2.2.2
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms"
arch=('x86_64')
url="https://www.gnu.org/software/$pkgname/"
license=('LGPL-2.1-or-later AND GPL-3.0-or-later AND GFDL-1.3-or-later')
depends=('gnutls' 'libidn' 'krb5')
source=(https://ftp.gnu.org/gnu/gsasl/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('62fb4a9383392e4816a036f3e8f408c5161a10723e59f0a8f6df5f72101e0b644787f3b07a71c772628fc4f4050960c842c7500736edacd24313ef654e703bc9'
            'SKIP')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE'   # Simon Josefsson <simon@josefsson.org>
              '9AA9BDB11BB1B99A21285A330664A76954265E8C')  # Simon Josefsson <simon@josefsson.org>
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gssapi-impl=mit
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
