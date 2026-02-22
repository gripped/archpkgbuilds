# Maintainer: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=libgcrypt
pkgname=lib32-$_pkgbasename
pkgver=1.12.1
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG (32-bit)"
arch=(x86_64)
url="https://www.gnupg.org"
license=(
    'BSD-3-Clause'
    'BSD-3-Clause OR GPL-2.0-only'
    'GPL-2.0-or-later'
    'LGPL-2.0-or-later'
    'LGPL-2.1-or-later'
    'X11'
    'LicenseRef-scancode-public-domain'
    'LicenseRef-OCB1'
)
depends=('lib32-libgpg-error' 'lib32-glibc' $_pkgbasename)
makedepends=(gcc-multilib libtool-multilib)
source=(https://gnupg.org/ftp/gcrypt/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.bz2{,.sig})
sha1sums=('b3c30f3366bfdb203a91b5dbea4dab29ed106779'
          'SKIP')
sha256sums=('7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c'
            'SKIP')
# validpgpkeys=(
#   '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
#   'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
# )
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA')  # "Werner Koch (dist signing 2020)"

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # Use 32-bit assembler
  sed 's:i\[34567\]86\*-\*-\*:x86_64-*-*:' -i mpi/config.links
  sed 's:x86_64-\*-\*:ignore:;s:i?86-\*-\*:x86_64-*-*:' -i configure.ac

  autoreconf -fi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}

  ./configure --prefix=/usr --disable-static --disable-padlock-support \
              --libdir=/usr/lib32 --enable-shared
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 {COPYING.LIB,LICENSES} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
