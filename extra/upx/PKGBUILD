# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: bekks <eduard.warkentin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Wang Haoyu

pkgname=upx
pkgver=5.1.0
pkgrel=1
pkgdesc='Extendable, high-performance executable packer for several executable formats'
arch=(x86_64)
url='https://github.com/upx/upx'
license=(custom GPL-2.0-or-later)
depends=(gcc-libs glibc)
makedepends=(cmake git perl)
# https://github.com/upx/upx/tree/v5.1.0/vendor
#b='v5.1.0'; for x in doctest lzma-sdk ucl valgrind zlib; do echo "git+\$url-vendor-$x#commit=$(git ls-remote https://github.com/upx/upx-vendor-$x $b-upx-vendor | cut -b-40)"; done
source=(
  "git+$url-vendor-doctest#commit=835aaee34666173532e98437b057f37b385076c9"
  "git+$url-vendor-lzma-sdk#commit=f9637f9f563d17b6ecf33ae2212dcd44866bfb25"
  "git+$url-vendor-ucl#commit=a60611d342b0b7d2924c495ebaa1910e4c3c3fe6"
  "git+$url-vendor-valgrind#commit=b054e44ea1b6d630853ed74d33e0934ef4642efc"
  "git+$url-vendor-zlib#commit=0a41a7d0a974d0b43afe4afe4b8025c8f144474e"
  "git+$url#tag=v$pkgver")
b2sums=('dc777d999688281298c64d9d7e9e215f5ecb2a2d38cb75f5cbeafae062bc915b5bf4e2e78c929256dbd15678f65eb688efbe8e94de1d9cf8be809936b4bcef5c'
        '4f52b23e4bc51420c32937c775e1f1a6ffff0db7930273f122d788a77fa4c88527953ad903e2bd21b1b00d2ea350ccde6c7f5aaa76b78d78f02a5b1225379bd6'
        'c900e601815a246a8beb792a99eba2242879f3b257d69907dd292d6e5f661c1230eae2a2c5e5533a42d293a6df7579f4d28db07aa812dedd3b9dee10837825ef'
        'e09769482c2484b38845234630344b774ee1b229cc910d4e0de85d439d277db4aa4a8eb3c47e0970b67cab065f61efacb17a23d67640288cf8b59fe53125a03f'
        '19433a84172cbdd8ff3a00091da2ac90459636834ae97412534efdb5a74df4c50c34cc7d7d0339d889dac58ce03c6e031f512a3b9d55e2b953c6c53d45645bfd'
        'c27d56feabd0cfe81b2ec23c4d886fafb911cd9a89fb85fb29f44dc0e385627e68a9e21105ba762b5c066d04c66d8e19cac29c143189fe5ccc59167f72e6193a')

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
    UPX_CMAKE_CONFIG_FLAGS='-D UPX_CONFIG_DISABLE_GITREV=1 -D UPX_CONFIG_DISABLE_SANITIZE=1 -D UPX_CONFIG_DISABLE_WERROR=1' \
    UPX_LZMA_VERSION=0x465 \
    UPX_LZMADIR="$srcdir"
}

check() {
  # Check that the version has the proper version number and not something like "git-877911+"
  $pkgname/build/release/upx --help | grep -q "^UPX $pkgver" || exit 1

  # Run tests
  make -C $pkgname/build/release test
}

package() {
  cd $pkgname
  install -Dm755 build/release/upx "$pkgdir/usr/bin/upx"
  install -Dm644 doc/upx.1 "$pkgdir/usr/share/man/man1/upx.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
