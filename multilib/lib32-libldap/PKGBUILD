# Maintainer:
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgbasename=libldap
pkgname=lib32-$_pkgbasename
pkgver=2.6.9
pkgrel=1
pkgdesc="Lightweight Directory Access Protocol (LDAP) client libraries (32-bit)"
arch=('x86_64')
license=('custom')
url="https://www.openldap.org/"
depends=('lib32-openssl' 'lib32-libxcrypt' $_pkgbasename)
makedepends=(gcc-multilib)
source=(https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz{,.asc})
sha256sums=('2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff'
            'SKIP')
validpgpkeys=('3CE269B5398BC8B785645E987F67D5FD1CE1CBCE') # OpenLDAP Project <project@openldap.org> https://www.openldap.org/software/download/OpenLDAP/gpg-pubkey.txt

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd openldap-${pkgver}

  ./configure --prefix=/usr \
              --libexecdir=/usr/sbin \
              --sysconfdir=/etc \
	      --mandir=/usr/share/man \
              --localstatedir=/var/lib/openldap \
              --enable-crypt --enable-dynamic \
              --with-threads --disable-wrappers \
	      --disable-spasswd --without-cyrus-sasl \
	      --disable-bdb --disable-hdb --libdir=/usr/lib32

  cd include
  make

  cd ../libraries
  make depend
  make

}

package() {
  cd openldap-${pkgver}

  cd include
  make DESTDIR="${pkgdir}" install

  cd ../libraries
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin} "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
