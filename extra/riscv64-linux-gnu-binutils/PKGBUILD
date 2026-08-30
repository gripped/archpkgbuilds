# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-gnu
pkgname=$_target-binutils
pkgver=2.46.1
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit RISC-V'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL-2.0-or-later)
groups=(risc-v)
depends=(
  glibc
  libelf
  zlib libz.so
  zstd libzstd.so
)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('e127a709cba24c76de8936cb7083dd768f28cd37eb010492e2f19b71eb1294e4')
b2sums=('a5a0578281d6315a43437ccf7636b3b91185c2706f1582b22af6973f55a86f5b4bc7eb03aa9ceaec547070152c08c982bc40ee9ce07679f2e3bb49e050bae76c')

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-gprofng \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --enable-multilib \
    --enable-new-dtags \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O
}

check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  make -O -C "binutils-$pkgver" LDFLAGS="" -k check
}

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
}

# getver: gnu.org/software/binutils
