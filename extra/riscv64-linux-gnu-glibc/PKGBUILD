# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=riscv64-linux-gnu
pkgname=$_target-glibc
pkgver=2.40
pkgrel=2
pkgdesc='GNU C Library RISCV target'
arch=(any)
url='https://www.gnu.org/software/libc/'
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=($_target-gcc $_target-linux-api-headers)
groups=(risc-v)
makedepends=(python)
options=(!buildflags !strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha256sums=('19a890175e9263d748f627993de6f4b1af9cd21e03f080e4bfb3a1fac10205a2'
            'SKIP')
b2sums=('8593cab5b2549b77159b6866fbb40b917e491fd5bc0814f7f85b6529166d78d4583436450c479b86cdfe468304fc4d2a9ba8294230a55dbc4c15e89c3ab6c000'
        'SKIP')
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar <siddhesh@gotplt.org>

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build

  echo 'slibdir=/lib' >> configparms
  echo 'rtlddir=/lib' >> configparms
  echo 'sbindir=/bin' >> configparms
  echo 'rootsbindir=/bin' >> configparms

  # remove hardening options for building libraries
  export CFLAGS="-U_FORTIFY_SOURCE -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-$pkgver/configure \
      --prefix=/usr \
      --target=$_target \
      --host=$_target \
      --build=$CHOST \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --with-headers=/usr/$_target/include \
      --with-bugurl=https://gitlab.archlinux.org/archlinux/packaging/packages/${pkgname}/-/issues \
      --enable-kernel=2.6.32 \
      --enable-add-ons \
      --enable-bind-now \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --disable-werror

  echo 'build-programs=no' >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="$pkgdir"/usr/$_target install
  # make install_root=$pkgdir/usr/$_target install-headers install-bootstrap-headers=yes
  # make csu/subdir_lib
  # mkdir -p $pkgdir/usr/$_target/lib $pkgdir/usr/$_target/include/gnu
  # cp csu/crt1.o csu/crti.o csu/crtn.o $pkgdir/usr/$_target/lib
  # $_target-gcc \
  #   -nostdlib \
  #   -nostartfiles \
  #   -shared \
  #   -x c /dev/null \
  #   -o $pkgdir/usr/$_target/lib/libc.so
  # touch $pkgdir/usr/$_target/include/gnu/stubs.h

  rm -rf "$pkgdir"/usr/$_target/{bin,sbin,etc,share,var}
}

# vim: ts=2 sw=2 et:
