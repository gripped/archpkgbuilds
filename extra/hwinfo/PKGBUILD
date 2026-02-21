# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: champus
# Contributor: madeye
# Contributor: ranguvar
# Contributor: ninja_pt

pkgname=hwinfo
pkgver=25.2
pkgrel=1
pkgdesc='Hardware detection tool from openSUSE'
arch=(x86_64)
url='https://github.com/openSUSE/hwinfo'
license=(GPL-2.0-or-later)
depends=(libx86emu perl-xml-parser perl-xml-writer util-linux-libs)
makedepends=(flex git sysfsutils)
options=(!emptydirs)
source=("git+$url#tag=$pkgver"
        custom_ioctl.patch)
b2sums=('4613436f1fadd7e22681c88c6078cbc91624dc61048904153da8dd03918940743dc2c1519b5049805c4e25729ac545f022805eeb827cc425832ceab1f1bc3f1c'
        '2b1bd3b53bbfc1e545e1a70ffd6cca08f704639a104928b2c02ccca3e82000f07a470fbdf129566ece6dfb2b98fdad0e82f18cc5c2016ebfeed043b4edb295b4')

prepare() {
  cd $pkgname
  patch -p1 -i ../custom_ioctl.patch
  echo 'touch changelog' > git2log
  sed -i '/linux\/fs.h/d' src/hd/hd.c
}

build() {
  make -C $pkgname -j1 CFLAGS+=" -fPIC -I$srcdir/$pkgname/src/hd -w" HWINFO_VERSION="$pkgver" LIBDIR=/usr/lib
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" LIBDIR=/usr/lib install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  cd doc
  for f in *.1; do install -Dm644 $f "$pkgdir/usr/share/man/man1/$f"; done
  for f in *.8; do install -Dm644 $f "$pkgdir/usr/share/man/man8/$f"; done
}
