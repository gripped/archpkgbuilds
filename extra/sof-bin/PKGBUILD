# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2025.05
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64)
license=('BSD-3-Clause AND ISC')
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
b2sums=('e50f6755b0a1deac6634e5fe2b2cd11e528373f8d7dbe371b6ec94e23a37b3a28b15e7ea2e9211b66ec14372f32667507eab687c972ec920046c440e8c929195')

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
