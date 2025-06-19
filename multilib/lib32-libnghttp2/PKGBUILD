# Maintainer: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=lib32-libnghttp2
pkgver=1.66.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library (32-bit)'
arch=('x86_64')
url='https://nghttp2.org/'
license=('MIT')
depends=('lib32-glibc' 'libnghttp2')
provides=('libnghttp2.so')
makedepends=('git')
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
source=("git+https://github.com/nghttp2/nghttp2.git#tag=v${pkgver}?signed"
        'git+https://github.com/ngtcp2/munit.git'
        'git+https://github.com/mruby/mruby.git'
        'git+https://github.com/tatsuhiro-t/neverbleed.git')
sha512sums=('4fe11b43a3f1ed92c7a5c2d80fa7b23757b9fe91f1dfd35adb28b12a40dc1a15695a653d12bb1dd0cd474300da4e4c9020b9a00e4ed8428cb89d8c6c2a603841'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd nghttp2

  git config --file=.gitmodules submodule.tests/munit.url ../munit/
  git config --file=.gitmodules submodule.third-party/mruby.url ../mruby/
  git config --file=.gitmodules submodule.tests/neverbleed.url ../neverbleed/

  git submodule init
  git -c protocol.file.allow=always submodule update

  autoreconf -i
}

build() {
  cd nghttp2
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only \
    --libdir=/usr/lib32
  make
}

check() {
  cd nghttp2
  make check
}

package() {
  cd nghttp2/lib

  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/include
  install -Dm644 ../COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
