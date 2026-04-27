# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=aarch64-linux-gnu
pkgname=$_target-binutils
pkgver=2.46
_pkgver="${pkgver}.0"
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM64 target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://ftpmirror.gnu.org/gnu/binutils/binutils-$_pkgver.tar.bz2{,.sig})
sha1sums=('0a64618bb1d511a9ebe9eba12b54cdd9847b329d'
          'SKIP')
sha256sums=('0f3152632a2a9ce066f20963e9bb40af7cf85b9b6c409ed892fd0676e84ecd12'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$_pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

}

build() {
  cd binutils-$_pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-gprofng \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-gold \
              --enable-ld=default \
              --enable-plugins \
              --enable-deterministic-archives \
              --enable-new-dtags

  make
}

check() {
  cd binutils-$_pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-$_pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
