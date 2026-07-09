# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=lib32-libngtcp2
pkgver=1.24.0
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
sha256sums=('91cd366311bf162e4387ecb36ef62f05b874dc776e9b984a64ec82ce38ac71dd'
            'SKIP'
            'SKIP')
b2sums=('b3921c2539889d36295ee2ca61bb4784ccfc104771593ac207d3077ec9fa2e5cb94324fc57f683e645f9a1aa484a1bd8ac0e6ff5e04654e4b5c94201622cfdd4'
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
