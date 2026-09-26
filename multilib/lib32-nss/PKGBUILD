# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgbase=lib32-nss
pkgname=(
  lib32-nss
)
pkgver=3.130
pkgrel=1
pkgdesc="Network Security Services (32-bit)"
url="https://firefox-source-docs.mozilla.org/security/nss/index.html"
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
  0001-Fix-generating-nss.pc-with-system-nspr.patch
  0002-Hack-mpi_x86.s-to-work-with-fno-plt.patch
)
b2sums=('f51bc240fca3436442edb342ce9f82a0a72a2620c7228f6b8af1284bc04fb24ee5e03ba2b76d839a87bd18e6727e22cd0ea3c34d75e325a6d08f80679b99e91d'
        'e219dc77e8d43ca790783d68f2829013a4c5bdc5ae49b91e4165900c50e5fbd695439be5ae999c7815e03c761ce41ae8ff91fa7cbc49da3ab067844e0f6763b3'
        '6d7bfcfc2b7681ca24b220b8f07d55e305342ee4e3475a221f71d21c83b5a5e998ef9e2779ca1c76d9075a80de0f42a7f97565ab568dc47530ee2accc9eec966')

prepare() {
  cd nss

  # Fix build
  patch -Np1 -i ../0001-Fix-generating-nss.pc-with-system-nspr.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../0002-Hack-mpi_x86.s-to-work-with-fno-plt.patch
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
  ln -sf pkcs11/p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}

# vim:set sw=2 sts=-1 et:
