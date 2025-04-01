# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgbase=lib32-nss
pkgname=(
  lib32-nss
)
pkgver=3.110
pkgrel=1
pkgdesc="Network Security Services (32-bit)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  lib32-glibc
  lib32-nspr
  lib32-p11-kit
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
  0001-Hack-mpi_x86.s-to-work-with-fno-plt.patch
)
b2sums=('23bcdd091fabc4965bb6a6665db8bffa658c74b7cfdea82ad51d3eb306e34fc3213fd193d9475d278a94e8f05c72e574b1d164a97418521546a48e18e0eda2d3'
        '6d7bfcfc2b7681ca24b220b8f07d55e305342ee4e3475a221f71d21c83b5a5e998ef9e2779ca1c76d9075a80de0f42a7f97565ab568dc47530ee2accc9eec966')

prepare() {
  cd nss

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../0001-Hack-mpi_x86.s-to-work-with-fno-plt.patch
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
