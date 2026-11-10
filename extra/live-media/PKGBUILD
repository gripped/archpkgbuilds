# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=live-media
pkgver=2026.10.24
pkgrel=1
pkgdesc='Set of C++ libraries for multimedia streaming'
url='http://live555.com/liveMedia'
arch=('x86_64')
license=('LGPL')
depends=(
  'libgcc'
  'libstdc++'
  'openssl'
)
source=(https://download.live555.com/live.$pkgver.tar.gz)
sha256sums=('5d6244604b364251d0c0b0fc87a849488958802245b1473eaaf55eaaef5a838b')
sha512sums=('a1e1bb7be550fc35d44f93a41ff113a28e1b218e5d7e6e3346bf8063d23088d1b0bac31890d3176329a94b1a1c63f7cf88c8c4abe322843c620c9f6fee5e4ae1')

prepare() {
  cd live
  find . -name Makefile.head | xargs sed -e 's|/local||g' -i # Fix prefix
}

build() {
  cd live
  sed -E 's|(-DSOCKLEN_T=socklen_t)|\1 -fPIC -DRTSPCLIENT_SYNCHRONOUS_INTERFACE=1|g' -i config.linux-with-shared-libraries
  ./genMakefiles linux-with-shared-libraries
  CXXFLAGS+=' -std=c++20' \
  make
}

package() {
  cd live
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
