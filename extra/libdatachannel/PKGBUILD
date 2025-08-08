# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libdatachannel
pkgver=0.23.1
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'openssl' 'libjuice' 'libsrtp')
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
sha512sums=('d71213aef4992865fb23703440d917ba06bfcce34ed9932e7654c6f0d95b988ec931f5f99f1303416b52389ad1f7c451847fd12331b9cadab80a1bb163bb63f3')

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
