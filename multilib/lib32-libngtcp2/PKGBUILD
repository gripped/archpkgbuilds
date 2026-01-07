# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=lib32-libngtcp2
pkgver=1.19.0
pkgrel=3
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
sha256sums=('96eee094ce67c196cdab1a52bfd7b78a55d88e6f01325acdc9ef02dd4ad0f9ae'
            'SKIP'
            'SKIP')
b2sums=('2365992af7e84b8a499b79b0f3eafc916d5286b9f4885a17741ba8672790c6f4d63a849ef2c034a2c392aad2e97ad8449cc59f753dafb0352b1ffd1e6960ecba'
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
