# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.4
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
sha512sums=('29e459fdc3539abef9385e2274218ae87b887711fcac80d78a43759196ec3c03605f27ad0334c8a409e035c3e60a00f00a1a796ab4eadaa926226d714f803d9c'
            '990c9423bd1816d24b4e0e451a529c8f1ec2807712a5f583f1d02f4c95e55e0851e9e08a9564180c1387a854eb3f1978eb1be0ac8162d18865e57f94035f870b'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '792ea395963242167a25cfe87a35a4ab1d149a98794cfb12b15f467c3716495f1c1206274b0b8ef20f10787452defbdbd0bc1cd2d70d177150d58708886763e9')
b2sums=('65721e2ed745c5e4e9604459a053ea3b629cd92da08b569a82b915f542e3c73f65976d32d668f8b047ec7ca33ef52b4b8b27b6b0b2ab94b2d475448938657f3d'
        '09dbed602874e7cd5ea1db175d8832ed010edef9efe9f4c74654c342127f862d009aa89761e940767e7a1e43e58743d8a24ee1465d976294ec5dc525daec59b3'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        'af082ebbf254a87f7922c0cf8b070162f6b85e5d8e1523968375e75e78eb0599fe21c9c08239c35e30f1a77c182c845b268beb91dd8177121eca9bed6df93f41')

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
