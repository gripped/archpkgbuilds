# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgbase=lib32-nss
pkgname=(
  lib32-nss
)
pkgver=3.102
pkgrel=1
pkgdesc="Network Security Services (32-bit)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  'lib32-nspr>=4.35'
  'lib32-p11-kit>=0.23.19'
  lib32-glibc
  lib32-sqlite
  lib32-zlib

  nss
)
makedepends=(
  gyp
  mercurial
  perl
  python
)
source=(
  "hg+https://hg.mozilla.org/projects/nss#tag=NSS_${pkgver//./_}_RTM"
  0001-Hack-mpi_x64.s-to-work-with-fno-plt.patch
)
b2sums=('66366090d0bfa278b6d9c41a8b1c4daafb7c9e1c2e127160e09341879100a4dc054fdde4c40653cadc7b8b78934869528993f04173279e76d8606a9c82edfb4b'
        '5a1f419e0cb6f61413bba9af4264bb1d8cc5b9a7d679b0b8fcceb030f6eeb50291509cd7317e2129d848048ad023818284f10942ce6d8c1bbcaaebc106a9726e')

prepare() {
  cd nss

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../0001-Hack-mpi_x64.s-to-work-with-fno-plt.patch
}

build() {
  local buildsh_options=(
    --disable-tests
    --enable-libpkix
    --opt
    --system-nspr
    --system-sqlite
    --target ia32
  )

  cd nss
  ./build.sh "${buildsh_options[@]}"
}

package_lib32-nss() {
  local nsprver="$(i686-pc-linux-gnu-pkg-config --modversion nspr)"
  local libdir=/usr/lib32 includedir=/usr/include/nss

  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,\${prefix},g" \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%includedir%,$includedir,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,$pkgver,g" |
    install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so

  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$pkgdir$libdir/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}

# vim:set sw=2 sts=-1 et:
