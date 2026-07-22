# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.5
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
sha512sums=('754302ca25810fcecff2fe78a789d4d5e2db479d3d24f501aa87d5b88a2edfa313db8e1e574e3f5eac4c49fe8bcfbd02f2f528790ef3631eb8dabc2b26de2c90'
            '5bad2507a1e9e19dae9b820b28ecb115b314ba7daf9984de2a750ddf2704495b0009f5e2fa5ff31033e9259de0fcd037335a9b21557aaa1d43a0f2a8a9fe84f5'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '7cdac593216c9ac8dbcdeb33047408608beef99b16a9834393581b444a018db9446e76169aec305ff0ee0e4a4967ee9a6f120b5c99b4f492b79b4eab6bba308f')
b2sums=('ea0931e4b4f46ddf66ea4999da272586172052ece856a12ac7e87bda5186136c1549edba879962f63e75e03900a43bff3d7c4f54ba1feae538056a508c4e9142'
        '6898dd853ce2ee6fee8625413803d7bcc403e51207056318f4f5ec4b85a2234e28699181076fff4499b7906038365bb481090218522af5b47b9da43046348aea'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        '5025bb1310e469628a0472e54621d898d1b1fdfe77c2c67861503a1c2a76ecff4320aef17c3d41601e075e4aa133778ee70d7fbb720d8eef873b72f75e22c058')

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
