# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-gnu
pkgname=$_target-gcc
pkgver=16.1.0
pkgrel=1
pkgdesc='Cross compiler for 32-bit and 64-bit RISC-V'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL-3.0-or-later WITH GCC-exception-3.1' 'GFDL-1.3-or-later')
groups=('risc-v')
depends=(
  "$_target-binutils"
  "$_target-glibc"
  "libgcc"
  'glibc'
  'gmp'
  'libisl' 'libisl.so'
  'libmpc'
  'mpfr' 'libmpfr.so'
  'zlib' 'libz.so'
  'zstd' 'libzstd.so'
)
options=(!emptydirs !strip  staticlibs !lto)
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz")
sha256sums=('50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79')
b2sums=('ceb07866b6b17eb4c69a6b51241b275bc5ec506603a7c1a4c1e2585091a09fc647be945beeff76700bffd9018bda81b072d84f909fd7998baa0cfe3f0eb550b4')

if [[ -n "$_snapshot" ]]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  rm -rf "$srcdir/gcc-build"
  mkdir "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  # Using -pipe causes spurious test-suite failures.
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/$_basedir/configure" \
      --prefix=/usr \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --target=$_target \
      --host=$CHOST \
      --build=$CHOST \
      --with-system-zlib \
      --with-isl \
      --with-linker-hash-style=gnu \
      --disable-nls \
      --disable-libunwind-exceptions \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --disable-multilib \
      --disable-werror \
      --enable-languages=c,c++ \
      --enable-shared \
      --enable-threads=posix \
      --enable-__cxa_atexit \
      --enable-clocale=gnu \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --enable-gnu-indirect-function \
      --enable-default-pie \
      --enable-checking=release
  make -j$(nproc)
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" \
    install-gcc install-target-{libgcc,libstdc++-v3,libgomp,libgfortran,libquadmath,libatomic}

  # Strip target binaries
  find "$pkgdir/usr/lib/gcc/$_target/" "$pkgdir/usr/$_target/lib" -type f \
    -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy \
    -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames \
    -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str \
    -R .debug_ranges -R .debug_loc '{}' \;

  # Strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir/usr/share/"{man/man7,info,"gcc-$pkgver"}
}

# vim: ts=2 sw=2 et:
