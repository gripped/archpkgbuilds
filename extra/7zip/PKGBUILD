# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=7zip
pkgver=26.06
pkgrel=1
pkgdesc='File archiver for extremely high compression'
arch=(x86_64 aarch64)
url='https://www.7-zip.org'
license=('LGPL-2.1-or-later AND LicenseRef-UnRAR AND BSD-3-Clause AND BSD-2-Clause')
depends=(
  sh
  libgcc
  libstdc++
  glibc
)
makedepends_x86_64=(uasm)
provides=(p7zip)
conflicts=(p7zip)
replaces=(p7zip)
source=("https://github.com/ip7z/7zip/releases/download/${pkgver}/7z${pkgver//./}-src.tar.xz")
sha512sums=('fba4d4b8630d2501fd53a1709231623a1a5d365128eb084ca8ab9aa9f9e04dccf8d97bc47ef50e63a7cf1281e677c43c47c2ee70a706dc67d3def9cfb1761bea')
b2sums=('23c75453953028bdb175c5f7cec92b19d6008b97905aa9a7c0adf90ad4479cc787d8ac5abbf72bb2c449bbf4cbb78c26363bb7b3fc32bf7889a484e9f8bc4343')

build() {
  local _platform_flags=()

  case $CARCH in
    x86_64)
      _platform_flags=(PLATFORM=x64 IS_X64=1 MY_ASM=uasm USE_ASM=1)
      ;;
    aarch64)
      _platform_flags=(PLATFORM=arm64 IS_ARM64=1 USE_ASM=1)
      ;;
  esac

  for component in Bundles/{Alone,Alone7z,Format7zF,SFXCon} UI/Console; do
    make -C CPP/7zip/$component -f ../../cmpl_gcc.mak "${_platform_flags[@]}" \
      LFLAGS_STRIP= \
      CC="cc $CPPFLAGS $CFLAGS $LDFLAGS" \
      CXX="g++ $CPPFLAGS $CXXFLAGS $LDFLAGS"
  done
}

package() {
  install -Dt "$pkgdir/usr/lib/7zip" \
    CPP/7zip/Bundles/Alone/b/g/7za \
    CPP/7zip/Bundles/Alone7z/b/g/7zr \
    CPP/7zip/Bundles/Format7zF/b/g/7z.so \
    CPP/7zip/UI/Console/b/g/7z
  install -D CPP/7zip/Bundles/SFXCon/b/g/7zCon "$pkgdir/usr/lib/7zip/7zCon.sfx"

  for _prog in 7za 7zr 7z; do
    printf '#!/bin/sh\nexec /usr/lib/7zip/%s "$@"\n' "$_prog" \
    | install -D /dev/stdin "$pkgdir/usr/bin/$_prog"
  done

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" DOC/{,unRar}License.txt
}

# vim:set ts=2 sw=2 et:
