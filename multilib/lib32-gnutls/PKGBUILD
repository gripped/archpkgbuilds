# Maintainer: Florian Pritz <bluewind@xinu.at>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-gnutls
pkgver=3.8.6
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit)"
arch=('x86_64')
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
url="https://gnutls.org/"
depends=('lib32-nettle' 'libnettle.so' 'libhogweed.so'
         'lib32-p11-kit' 'libp11-kit.so' 'lib32-libtasn1' 'libtasn1.so'
         'lib32-libidn2' 'gnutls' 'lib32-brotli' 'lib32-zstd')
makedepends=()
provides=('libgnutls.so' 'libgnutlsxx.so')
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz{,.sig})
sha256sums=('2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5dd61a7e81e0ebcdd'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # "Daiki Ueno <ueno@unixuser.org>"
              '5D46CB0F763405A7053556F47A75A648B3F9220C') # "Zoltan Fridrich <zfridric@redhat.com>"


build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd gnutls-${pkgver}

  # disable libidn for security reasons:
  # http://lists.gnupg.org/pipermail/gnutls-devel/2015-May/007582.html

  ./configure --prefix=/usr --libdir=/usr/lib32 --build=i686-pc-linux-gnu \
    --with-zlib \
    --with-included-unistring \
    --disable-year2038 \
    --disable-static \
    --disable-valgrind-tests
  make
}

check() {
  cd gnutls-${pkgver}
  #make check
}

package() {
  cd gnutls-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  # lib32-p11-kit tests need a 32-bit p11tool
  mv "$pkgdir"/usr/bin/p11tool{,-32}
  find "$pkgdir"/usr/bin -type f -not -name '*-32' -delete
}

# vim:set sw=2 sts=-1 et:
