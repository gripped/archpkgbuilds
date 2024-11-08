# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2024.09.1
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64)
license=('BSD-3-Clause AND ISC')
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
b2sums=('e2d40f424703b086678df93c8476d7c4e434fe7712f350009fdf3994a125bdccc90d1279853356df79ffad178b5e398e4894f7182ebd96edd0527101e0f74627')

prepare() {
  cd sof-bin-$pkgver
  sha256sum -c sha256sum.txt
}

package_sof-firmware() {
  options+=(!strip)

  local fwdir="$pkgdir/usr/lib/firmware/intel"
  mkdir -p "$fwdir"

  cd sof-bin-$pkgver

  cp -at "$fwdir" sof*

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

package_sof-tools() {
  pkgdesc+=" - tools"
  depends=(
    alsa-lib
    glibc
    python
  )

  cd sof-bin-$pkgver

  install -Dt "$pkgdir/usr/bin" tools/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

# vim:set sw=2 sts=-1 et:
