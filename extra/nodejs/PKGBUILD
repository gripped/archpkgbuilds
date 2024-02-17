# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs
pkgver=21.6.2
_commit=3eccdd1ae61777a381a7ac3bc0ea62443dbb50b8
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
options=(!lto)
depends=('icu' 'libuv' 'libnghttp2' 'libnghttp3' 'libngtcp2' 'openssl' 'zlib' 'brotli' 'c-ares') # 'http-parser' 'v8')
makedepends=('git' 'python' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("git+https://github.com/nodejs/node.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd node

  # /usr/lib/libnode.so uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  ./configure \
    --prefix=/usr \
    --without-npm \
    --with-intl=system-icu \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-nghttp3 \
    --shared-ngtcp2 \
    --shared-openssl \
    --shared-zlib \
    --shared-brotli \
    --shared-cares
    # --shared-v8
    # --shared-http-parser

  make
}

check() {
  cd node
  make test || :
}

package() {
  cd node
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/nodejs/
}

# vim:set ts=2 sw=2 et:
