# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=zlib
pkgname=lib32-$_name
pkgver=1.3.2
pkgrel=2
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (32-bit)'
arch=(x86_64)
license=(Zlib)
url="https://www.zlib.net/"
depends=(
  lib32-glibc
  $_name
)
provides=(libz.so)
source=(
  https://github.com/madler/zlib/releases/download/v$pkgver/$_name-$pkgver.tar.xz{,.asc}
  $_name-1.3.2-CVE-2026-85091.patch::https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch?full_index=1
)
sha512sums=('cf3d49fbabddc57cca99858feeca8f910e9de42a16014cddd406814d2d24ee33fee2af3805d7efbb1b04b05f55818092b000daf82502b675df65f2512c353f73'
            'SKIP'
            'a8cca9039ff9f09f92fa7fbcf5c6744615e8cd71a033784c0b996ee931af0dfa69f5b6efb67243693d418b9b3e1f7dadc178335bd407b72b0d72bdc4679da9ff')
b2sums=('fd3a6e4c275a925f4814de487075c136e28421ea34ca7f93141781e7a414b392cd849fbf96cfcb24e825441df5f3c64be54276c0f617dc2d5c865d4ab260e83c'
        'SKIP'
        '9c677876fadbd9f0db7c3a6238ed3597960f94723d47956c6ffe44dda38cdec7e08a72b4b601d313c59d1d0fe46536196be8bf0b6d03ba8aff1060e1aaa2bf2b')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$_name-1.3.2-CVE-2026-85091.patch

  # NOTE: We are not running autoreconf for the top-level project, because `configure` is a custom script.
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  make test -C $_name-$pkgver
}

package() {
  make install DESTDIR="$pkgdir" -C $_name-$pkgver

  rm -rf "$pkgdir"/usr/{include,share,bin}
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
