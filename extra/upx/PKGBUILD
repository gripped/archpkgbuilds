# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: bekks <eduard.warkentin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=upx
pkgver=4.2.0
pkgrel=1
pkgdesc='Extendable, high-performance executable packer for several executable formats'
arch=(x86_64)
url='https://github.com/upx/upx'
license=(custom GPL2)
makedepends=(cmake git perl)
# The fixed git commits are from the upx-vendor branches in the upstream repositories.
# for x in doctest lzma-sdk ucl valgrind zlib; do echo "git+\$url-vendor-$x#commit=$(git ls-remote https://github.com/upx/upx-vendor-$x upx-vendor | cut -b-40)"; done
# Updated: 2023-10-28
source=(
  git+$url-vendor-doctest#commit=15e49a5fb7e49dd8f590d3666534b209e7212c6c
  git+$url-vendor-lzma-sdk#commit=f0b8d236c1bdf66532a198c983469da5c05593cf
  git+$url-vendor-ucl#commit=2c68ae51994892b9080328617a84296ee55f0c80
  git+$url-vendor-valgrind#commit=99729b48985f15bc1307862c539cc58862e38dfa
  git+$url-vendor-zlib#commit=29fceaffe38ef80e404bfa92a47b192b6e887d15
  "git+$url#commit=9c46f4653fe24a96c6723de5b69c6145d9956dac") # tag: v4.2.0
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd $pkgname
  # Set up symbolic links for the vendor repos.
  for x in doctest lzma-sdk ucl valgrind zlib; do
    rm -frv vendor/$x && ln -s "$srcdir/upx-vendor-$x" vendor/$x
  done
}

build() {
  make -C $pkgname \
    CHECK_WHITESPACE=/bin/true \
    CXXFLAGS_WERROR="" \
    UPX_CMAKE_CONFIG_FLAGS='-D UPX_CONFIG_DISABLE_GITREV=1' \
    UPX_LZMA_VERSION=0x465 \
    UPX_LZMADIR="$srcdir"
}

check() {
  # Check that the version has the proper version number and not something like "git-877911+".
  $pkgname/build/release/upx --help | grep -q "^UPX $pkgver" || exit 1
}

package() {
  cd $pkgname
  install -Dm755 build/release/upx "$pkgdir/usr/bin/upx"
  install -Dm644 doc/upx.1 "$pkgdir/usr/share/man/man1/upx.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
