# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=lib32-libngtcp2
pkgver=1.23.0
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
source=("git+https://github.com/ngtcp2/ngtcp2.git?signed#tag=v${pkgver}"
        'git+https://github.com/ngtcp2/munit.git'
        'git+https://github.com/ngtcp2/urlparse.git')
sha256sums=('3c2fb387558336dfcd2da18c11d32ac745ede9a30f42c2734c5fb44fe383c082'
            'SKIP'
            'SKIP')
b2sums=('361a86b2e9324e1b892d8673990b9d45ba877230bf398dbe10abb61a44c33d8364b6ae883b601868b738ff987a1976303e50d62a85dc4ac97f095f9d5ecf99e6'
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
