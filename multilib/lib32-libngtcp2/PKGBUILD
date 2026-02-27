# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=lib32-libngtcp2
pkgver=1.21.0
pkgrel=1
pkgdesc='Implementation of IETF QUIC protocol (32-bit)'
url='https://github.com/ngtcp2/ngtcp2'
arch=('x86_64')
license=('MIT')
depends=(
  'libngtcp2'
  'lib32-glibc'
  'lib32-openssl' 'libssl.so'
  'lib32-gnutls'
)
makedepends=(
  'git'
  'libngtcp2'
  'lib32-brotli'
)
provides=(
  'libngtcp2.so'
  'libngtcp2_crypto_gnutls.so'
  'libngtcp2_crypto_ossl.so'
)
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
source=("git+https://github.com/ngtcp2/ngtcp2.git#tag=v${pkgver}?signed"
        'git+https://github.com/ngtcp2/munit.git'
        'git+https://github.com/ngtcp2/urlparse.git')
sha256sums=('beb57886229d8580829c22e300f46b1b56ca0d50398da675cc095d539ce5dee9'
            'SKIP'
            'SKIP')
b2sums=('53c514d8d5281248138ffac02b5eb92238105288462b56de0ac1b0067b2d37c2a4bc62125e9e0d4e9c32d857df8fe8df12d1038588519157d637d06e93e6ad3a'
        'SKIP'
        'SKIP')

prepare() {
  cd ngtcp2/

  git config --file=.gitmodules submodule.tests/munit.url ../munit/
  git config --file=.gitmodules submodule.third-party/urlparse.url ../urlparse/

  git submodule init
  git -c protocol.file.allow=always submodule update

  autoreconf -i
}

build() {
  cd ngtcp2/

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-libbrotlienc \
    --with-libbrotlidec \
    --with-gnutls \
    --enable-lib-only
  make
}

package() {
  cd ngtcp2/

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{include,share}
  install -D -m0644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
