# Maintainer: Filipe Laíns <lains@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Rachel Mant <aur@dragonmux.network>

pkgbase=kicad-library
pkgname=($pkgbase{,-3d})
pkgver=9.0.8
pkgrel=1
pkgdesc='Assorted libraries for KiCad'
arch=(any)
url='http://kicad.org/'
license=(CC-BY-SA-4.0)
makedepends=(git cmake)
options=(!strip !debug)
source=(
  "git+https://gitlab.com/kicad/libraries/kicad-packages3D.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-symbols.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-templates.git#tag=$pkgver"
  "git+https://gitlab.com/kicad/libraries/kicad-footprints.git#tag=$pkgver"
)
sha512sums=('a3a6ba3027bcef087cb5b05a9a7f493c2e69fa2d990e925bf16f81a5baf923112d5870978ff3937519e9da53d41fe8f4878a92c5f59aeda74da13f995c432fb0'
            '332049ae9f1d3744f465928f8aca0d5dc8bf83a4e03e4883ec2db3d023fac77b059e883a93fd43026a31a42b015bbca44dc0f9781fce5cd4b2e3997a77d24798'
            '46b8685d7104decb21569aacad2a7941bb3101b09428039e3e17068a1261fa3e26c5a0dd2767ca56264f3bb5bf25358587a0878d50e698776375ab2ad9d9ddd6'
            'a50eb3992bfa75c2f7cdd1f944dbbeb7a7491c222ba5748f5565ad6ce0027927fe8a234d344ce64e0da89fa321830cb866bc1dcb2fa70aa360efc018dc3c4d8c')
b2sums=('ba2f9dc740ca1c0ade8f9f23791b8af9ce52d2a89c371c7956b22f395ff05d42ddcf2de48e01a33edb3c4c10a11ba719e207e8444bfb7fec2a50cc96a42f4a2e'
        '2789a13670462cff4b93e6b024e5b5d1870e366d9e68e321e8d2a4565cc4865524d88f5f3f0f4e7ad5a5233e6c9e2218171398c76b168d8581196a1ed3132c45'
        'c54b437f06d78baa1123ad0e16028f12068082cbfb9a51c64abc7f44d62499761304bf3a5f97e0374f5f9cf3de6bcbf8aab3bdbc576747eb794cd669ec26fab6'
        'bd5542cc15d72eb98884f53863d3c0584f1075aba0152ef198315b854638b0d016af17f20d431676d20ebb7f678ace38cfdad12fd6f53e150dd0539b91b98472')

build() {
  for package in symbols footprints packages3D templates; do
     cmake \
       -B "build-$package" \
       -S "kicad-$package" \
       -DCMAKE_INSTALL_PREFIX=/usr

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
