# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org> 
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.4.3
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=('x86_64')
license=('GPL-2.0-only')
source=("git+https://github.com/lipnitsk/libcue.git#tag=v$pkgver")
depends=('glibc')
makedepends=('bison' 'cmake' 'flex' 'git')
sha512sums=('70acfe327c8b533a4e6d3dace354f6da316168751ede3eabc21e90a316db0e531418ca58f817fa3c9ad3889bd61780bd8fbd1ec2a66887dd1575041622e66f2b')

build() {
  cmake -B build -S "$pkgname" \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
