# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.6
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
sha512sums=('d960f896dbef837a3b1621d7205894bb3ac90aaaa5907849a3fca432519c789802e4c4cf8833ca6522f06143b4a68858d2641fb4edf0f1e77b62cd3d585bbe7a'
            '08df68ae693af30ca61d8d135fdd4e185709af03a4349cc4470adc81cb62268d64cf6882b9c6a9d0c6e031c9828f3a18179b29d0e64e3296ce98508e5ad48828'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '692cd31905dbe8203de5e2bd1d500d1d89d77efc6953ffb5cc188d263b6cdf1ba7a3069c0422ad88c6951b63a38fc4fe02a26865ff77139735b4a59684dab27d')
b2sums=('0d4f94c567e2fb5ca6e07a859c7864bddf3333979b625dc2ac40b15007ef01be0678ba1958087c91d6cc2f73646ba269889d310873c6f82588dbda6005de87ce'
        '56ee8c722509c1a2b65409ff2b9edf9e5c27d73a5c138121707d48948257c07bc7948f3bd84be22f2ad0252ea84f4e83397bc059a89a718f9330083bc9253c0f'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        '8596c4788d2bc4ba8359c53bc159368df178235d84a9ac5ef0780dc9dd7d291847251f05274b72e6ea7fc2c76439d938e9ff4c146f18ef0759ea3e0f3bb99f66')

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
