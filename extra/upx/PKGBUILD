# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: bekks <eduard.warkentin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Wang Haoyu

pkgname=upx
pkgver=4.2.3
pkgrel=1
pkgdesc='Extendable, high-performance executable packer for several executable formats'
arch=(x86_64)
url='https://github.com/upx/upx'
license=(custom GPL2)
makedepends=(cmake git perl)
# https://github.com/upx/upx/tree/v4.2.3/vendor
# b='v4.2.3'; for x in doctest lzma-sdk ucl valgrind zlib; do echo "git+\$url-vendor-$x#commit=$(git ls-remote https://github.com/upx/upx-vendor-$x $b-upx-vendor | cut -b-40)"; done
source=(
  git+$url-vendor-doctest#commit=6f57b91261fef5d19fd1abd7b917eec847cc7389
  git+$url-vendor-lzma-sdk#commit=f0b8d236c1bdf66532a198c983469da5c05593cf
  git+$url-vendor-ucl#commit=2c68ae51994892b9080328617a84296ee55f0c80
  git+$url-vendor-valgrind#commit=7d98b64a47e96dad7a618822a99425d7800cc233
  git+$url-vendor-zlib#commit=d1e32cf59c1fc95fe7ccecedbbd2098594a39dee
  "git+$url#commit=5bef96806860382395d9681f3b0c69e0f7e853cf") # tag: v4.2.3
b2sums=('6f28181ddf95abdd286f0c92001a44931a230dc349bc34f8c72173de2e8f7366104db75df3fe1b88e8656d5dff29be71e5563bcf730a61b916241dd725952c39'
        '8524395a34a5ffda4d2e7656db33a433e44843a20d5ab38f8080976cae922243eea81849c5feda44a3a5d805740257716cf0e08494da6777fc6c83b981e24deb'
        '1b278981d40e2afef3dcb4aa8ba60c48072190a6d8ec909c8ec322007f1049fa17da945b1a2ec0dfcd762f8c1bb8c3a68355c675f969f9137ba8121f1faee15c'
        '1b6c67dd46a3ab5448a19185b1a225c69752b93239241208eda92905bc896fbff0c1426f0e7b777a38f1d0bd8327c435ae695cd85f920f442595feaef1a16128'
        '9ef23434fd724757f4eeb9f29eaa4f92caec2148b3362ca7995c768e1016d708a63e339b12e5eb43eaa51e62d13f4ddeefe46535a61268df820decfb88843930'
        'd79fd1e89117612f33ee2f1ac7c537d3e0d6320a3a98a4acc73fa65f45ec11f8305a414d360636c0368451cb746dbb0ac923177943481b23e912267109b4d308')

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
  # Check that the version has the proper version number and not something like "git-877911+".
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
