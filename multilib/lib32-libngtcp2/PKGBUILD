# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=lib32-libngtcp2
pkgver=1.22.1
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
sha256sums=('24817c6ddad07d405906d1bf0b87f31342b78897700693909b931e408e785732'
            'SKIP'
            'SKIP')
b2sums=('df385b161208759daa21a863b9c9145b96b36f6d2bc93cf27224c37903586142edcc5b5a833f5affaa2e863d291b8fbe12417e735f6bb8c8e75772361f0ebd9c'
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
