# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libdatachannel
pkgver=0.24.3
pkgrel=2
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'cmake')
depends=('glibc' 'libstdc++' 'libgcc' 'openssl' 'libjuice' 'libsrtp')
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
sha512sums=('3d96985dd7de588ecc4c0ccbce104d7a79fc0f27d1c9338924571cd367a4e71afb097af1c2bdf1aa93e394819e95673c64ed8cea402cb210d518a3f5f46f6f05')

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
