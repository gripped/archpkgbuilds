# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=gzip
pkgver=1.14
pkgrel=1
pkgdesc='GNU compression utility'
arch=('x86_64')
url='https://www.gnu.org/software/gzip/'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash' 'coreutils' 'sed' 'grep')
makedepends=('less')
optdepends=('less: zless support'
            'util-linux: zmore support'
            'diffutils: zdiff/zcmp support'
           )
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE') # Jim Meyering
source=("https://ftp.gnu.org/pub/gnu/gzip/gzip-$pkgver.tar.xz"{,.sig})
sha256sums=('01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6'
            'SKIP')
prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
