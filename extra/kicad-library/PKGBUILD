# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.8
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
sha512sums=('ef98fd32d396f21b92f0f8c6c19cecc451d523ab4b73e480a2a0cfeda165aec6ca7b2fca199c0f714b53ce3a809b4412f8731aa36c759d336d2cc2a29831fa54'
            'aa958ea6c7847741838d3b6a45fe0eef9901b4a5a25138037b766630bcf995874c75fa898b9a26ce745f52bd6bd4bb87e92a26ee3e80716fc0c6af1db6f89610'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '22c7b2c145e6e9cd68f2405cd0c675ddacf9077335180dec40fb87b934462141b1a73ad8e19c2deebdc8974c684d5c25890de4c98e2f25377bd121635f6b9456')
b2sums=('a57313357fbfdf6c7af1c52b59230f6f712d98cd4d00709af88aebb64de32d7355aea3215cce76be3f585c9e3fb964d4a5b69c79aa4adeb7428f51e9d910c7d6'
        '6c370bc000ae5852f6a43a3852cd0f067c788a996f74de9ab6ab0a74108d93b6567cd23af299ccc087dbaa4a8deb89aae03422761c713b75c555e68e9c41cf9e'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        '84e7453f57641921de2cfdd2568eca7ae866d2b987db73974335bff46a8049bf91d5123982769e7e9dd4b7da2b33577cf75086775ac2a7bacf94a8af3445ae73')

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
