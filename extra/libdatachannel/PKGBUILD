# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libdatachannel
pkgver=0.21.1
pkgrel=2
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'openssl' 'libjuice' 'libsrtp')
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
sha512sums=('01eaeebc739d372b4745ab866921884e59390274e3e8f3f9f90d0993eb51b6d34915ed7675f038ad7e1fd66c945979ca5b0fc1338efdd92f24f7ac810f2f160d')

prepare() {
  cd $pkgname
  git submodule update --init --recursive "$srcdir"/"$pkgname"/deps/{usrsctp,plog}
}

build() {
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
