# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=jemalloc
epoch=1
pkgver=5.3.0
pkgrel=7
pkgdesc='General-purpose scalable concurrent malloc implementation'
arch=('x86_64')
license=('BSD')
url='https://jemalloc.net/'
depends=('glibc' 'libgcc' 'libgcc_s.so' 'libstdc++' 'libstdc++.so')
provides=('libjemalloc.so')
optdepends=('perl: for jeprof')
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        'jemalloc-0001-default-page-size-on-Aarch64.patch::https://github.com/facebook/jemalloc/commit/7dcdafea00a3a02cfbc84a798a0cc626515011eb.patch')
sha256sums=('2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa'
            'ca3db9017aa5f0cdac33d58fff1e2a236fb8f0572081b0e8c3a8fc3a9667ac6c')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 < ../jemalloc-0001-default-page-size-on-Aarch64.patch

  autoconf
}

build() {
  cd $pkgname-$pkgver
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"

  ./configure \
    --enable-prof \
    --enable-autogen \
    --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  chmod 644 "$pkgdir/usr/lib/libjemalloc_pic.a"
}
