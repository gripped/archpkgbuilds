# Maintainer: judd <jvinet@zeroflux.org>

_pkgbasename=libgpg-error
pkgname=lib32-$_pkgbasename
pkgver=1.48
pkgrel=1
pkgdesc="Support library for libgcrypt (32-bit)"
arch=(x86_64)
url="https://www.gnupg.org"
license=('LGPL')
depends=('lib32-glibc' $_pkgbasename)
source=(https://www.gnupg.org/ftp/gcrypt/libgpg-error/${_pkgbasename}-${pkgver}.tar.bz2{,.sig})
sha512sums=('3e9ea99cfb7d706791eb3349a9356b6bc44a53ef8bfa9a4e89afb5203dad5af3f466a039a1764361c0c7f697a6fa668a21d05ceaeb8e44ec5a11d6468998adf2'
            'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'  # Werner Koch
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD'  # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
              '6DAA6E64A76D2840571B4902528897B826403ADA') # "Werner Koch (dist signing 2020)"

prepare() {
  cd ${_pkgbasename}-${pkgver}
  sed -e 's|/var/example-target||' -i src/gpg-error-config-test.sh.in # Fix pkgconfig test with pkgconf 1.8
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  make check
}

package() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  make DESTDIR="${pkgdir}/" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
