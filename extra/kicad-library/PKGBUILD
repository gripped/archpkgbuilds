# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.3
pkgrel=1
pkgdesc='Assorted libraries for KiCad'
arch=(any)
url='http://kicad.org/'
license=(CC-BY-SA-4.0)
makedepends=(git cmake python)
options=(!strip !debug)
source=(
  "git+https://gitlab.com/kicad/libraries/kicad-packages3D.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-symbols.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-templates.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-footprints.git#tag=$pkgver"
)
sha512sums=('eb1f6f5b414a399f1a351efbce1272680b51b01c9c8674be923f49986eb1fdadb2d4c44bde0d3054c1546e27dabcf8fd9f03b41b3ca72dc158280d0dfbfa4b6c'
            'e9ccb5fec00e5b589a61a8af94d83f6350e87b9944853295dd4bb908df68c93ed6b201ff18a26d67b75c8b9f7960c1229c179a2c0ad23a95d285e1cc6958b2a4'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            'de6a05317bbfa7ddcc63ccc5c6e55f5788c2754a765475d3f6ef02d6451338600b9322db6a097e99dedf2681af002963bb3bbea32dbb47fdb36316d7d5c3e2cc')
b2sums=('8da9e9ed44be19d742d333cf8820272dd855b1295683e8a50ca4af9f27c4aecb532206957aed4f26b999e48009b4a81a1ec70adafb6a2602ecc886ab66d34348'
        'dff8cfc85dcf0c334af575d0b25bd5b08876309507d141598c3d3751465c9c861fc789c66c511c8280e2b8fcac7a6696bbe76ff6a2717b0525aa0513b15e5801'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        '621beb7af850c4f382cbaa65bb15118c6b404d43239508e089f347e5792bc432256c09ef6ec9cdc627c7814db04460cfa9598f139be82fb76721bdca4ea4dbf7')

build() {
  for package in footprints packages3D templates; do
     cmake \
       -B "build-$package" \
       -S "kicad-$package" \
       -DCMAKE_INSTALL_PREFIX=/usr
  done

  # Symbols are 'packed'
  cmake \
     -B "build-symbols" \
     -S "kicad-symbols" \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DKICAD_PACK_SYM_LIBRARIES=ON

  for package in symbols footprints packages3D templates; do
      cmake --build "build-$package"
  done
}

package_kicad-library() {
  pkgdesc="KiCad symbol, footprint and template libraries"

  for package in symbols footprints templates; do
    DESTDIR="$pkgdir" cmake --install "build-$package"
  done
}

package_kicad-library-3d() {
  pkgdesc="KiCad 3D model libraries"

  DESTDIR="$pkgdir" cmake --install build-packages3D
}

# vim:set ts=2 sw=2 et:
