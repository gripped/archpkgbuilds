# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libdatachannel
pkgver=0.24.2
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'openssl' 'libjuice' 'libsrtp')
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
sha512sums=('2364f2d426e9b293e5ce3c1979664db7f32b41ea85261e0939fd0987fa5b1f329574a1139880e238dc50d6b29931983ca588ee9bf893325e98235caa38d78dad')

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
