# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.0
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
sha512sums=('a26c3fb6e821144644972ac2065529073a184ebd846bfc2ab1671b5edcb2ca8175e5335dc65c5287a0d6e35b86f6bc5f42106110c5e9a63174f306a040519d70'
            'd73a5408838499c9504e0d93af35c531b76b317195e3e054d2d33c1874340704d684567c2bd1efd85321666c6a19c1b2d054bdc9ebb115627a23c031a008c81f'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '83bfa5cf19be54c1012f4327f6d5c7c4b9890ba96b0114306136ec2ecca3c8eb99b5ff8c8622d7d05621aeeabee618d9d7481414a0fd104d894ba031391152be')
b2sums=('e5f8dac189e65555ee94d8201c327dc678983eb6f742ed89028ad38bd9ddd143cb4b0bcb499602bea9557c8c736131947b1974308778f37c2bcec31b81df3d03'
        'e1bd8430745288fc447e3aac815c79d27ef9b976f42d4fdeb9c0cf3ff4166d8fc0d20a84fcfd997f81dff18191701f53ebe102640783e28152b0737a24f67b24'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        'edffb46bacfc88145f5affa55724ff5346688aa9b957ddcb235f47aa3e56ae36578fcaaefefc4e68d813c67173826af32994c771e71aee4ba749d3f65e341a07')

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
