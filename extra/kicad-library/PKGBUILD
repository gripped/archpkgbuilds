# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=10.0.1
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
sha512sums=('202dc27022ce9c21cdff66dafa5ef3ba224a92b7e0226f6078bf1e2b113f835ec563a852b03d980424f58283019c80d90bbcbdfa4f410258e497d7f3673d9e0a'
            'a3cac61633de6c674bf0b2f8ed8486cbd01df9ad4571f0959cdae86d182b110f3ff887d94c2a8d92e8c34e08965f55e46738493f8f73a9334f7df4230ac24ef8'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            '3dfc8ce886e1a915f89448ecc9e6ba03797ff3ff7ce600970d8a1f6b33c18b387dd016ab1898191eb300499484424c05b28d0e8b2ec9d9e58ee9e7208dc4babd')
b2sums=('73d2b3ac96ed24646e3386f816c689dd4c445db8f293b241aa4686a4045e03ffefe0c051c6af69f1124c031f03538262d1bf78884762ec3d0d27760201c4750f'
        'e5c6534e48d91939812d809b99ab8d219b9e637eaeccd5250592f40f53120b780ae4aac5d6a36e6be66ab91ff725612f0b99ab903b362798bc69d69ce18aded3'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        '726475158c17cd1694dd88b81a949e9a1c6e5841d826ab06d5ac043c307e645f89a5d899625a0742c48b3eabd3c37294b7bd4263b4ae5b3409a1499add900461')

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
