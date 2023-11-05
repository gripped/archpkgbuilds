# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2023.09.1
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64)
license=(
  custom:BSD
  custom:ISC
)
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
b2sums=('8f52d5855cc58cd03fc9a1c0afa69e00ebbd7ff43a7d02401253cf8340d2722c9cb4e5f96d4d4c593fe160d48d5046bed4f4dc8c7813696b8128c65138365cd8')

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
    python
  )

  cd sof-bin-$pkgver

  install -Dt "$pkgdir/usr/bin" tools/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

# vim:set sw=2 sts=-1 et:
