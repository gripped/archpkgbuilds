# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2025.12
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64)
license=('BSD-3-Clause AND ISC')
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
b2sums=('935f909e4b5ab9fed3424767b660e7ac3b96e121f23d2b52d0b0f24e82877e1acbd54fce530861f43bf01b1b0343874959a0e75c712440c15bc761b3d9d643f2')

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
