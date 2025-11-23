# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libdatachannel
pkgver=0.24.0
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'openssl' 'libjuice' 'libsrtp')
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
sha512sums=('503102ad81468102d8a7fbf9d8c8df059be536928877da67586d3e3940b19c810475334317e7bb413eb50e86071eb2f4c1d9d08f84fcbe288d94453352e1baa0')

prepare() {
  cd $pkgname
  git submodule update --init --recursive "$srcdir"/"$pkgname"/deps/{usrsctp,plog}
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_GNUTLS=0 \
    -DUSE_NICE=0 \
    -DUSE_SYSTEM_JUICE=1 \
    -DUSE_SYSTEM_SRTP=1 \
    -DNO_EXAMPLES=1 \
    -DNO_TESTS=1 \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  cd $pkgname
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
