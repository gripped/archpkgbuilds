# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave
pkgver=9.4.0
pkgrel=1
pkgdesc='A high-level language, primarily intended for numerical computations'
arch=('x86_64')
url='https://www.gnu.org/software/octave/'
license=('GPL')
depends=(
  'fftw'
  'curl'
  'graphicsmagick'
  'glpk'
  'hdf5'
  'qhull'
  'arpack'
  'glu'
  'ghostscript'
  'sundials'
  'gl2ps'
  'qscintilla-qt6'
  'libsndfile'
  'qt6-5compat'
  'qt6-tools'
  'qrupdate'
  'pcre2'
)
makedepends=(
  'gcc-fortran'
  'suitesparse'
  'texinfo'
  'gnuplot'
  'fltk'
  'portaudio'
  'jdk-openjdk'
  'rapidjson'
)
optdepends=(
  'texinfo: for help-support in octave'
  'gnuplot: alternative plotting'
  'portaudio: audio support'
  'java-runtime: java support'
  'fltk: FLTK GUI'
  'texlive-bin: for the publish command'
)
source=("https://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.gz"{,.sig})
options=('!emptydirs')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton
sha512sums=('fd6fb54db05d0e1b6157feab747e6301341cf698e282b5149ccdeb64fef0ad86bdbc42ad29b64d23842038b2233a76b3215f792ab1df14e714e259b77316a247'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"

  # suppress warning message below:
  # egrep: warning: egrep is obsolescent; using grep -E
  export EGREP="grep -E"

  # Workaround build failure with sundials 7
  LDFLAGS+=" -lsundials_core" \
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-shared \
    --disable-static \
    --with-quantum-depth=16

  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package(){
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # add octave library path to ld.so.conf.d
  install -d "$pkgdir/etc/ld.so.conf.d"
  echo "/usr/lib/$pkgname/$pkgver" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  # dirty hack to make package reproducible
  local ARCHIVE_DATE="$(TZ=UTC date --reference=ChangeLog --iso-8601=seconds)"
  mkdir tmpdir
  cd tmpdir
  jar --extract --file="$pkgdir/usr/share/octave/$pkgver/m/java/octave.jar"
  rm -rf "$pkgdir/usr/share/octave/$pkgver/m/java/octave.jar"
  jar --create --date="$ARCHIVE_DATE" --file="$pkgdir/usr/share/octave/$pkgver/m/java/octave.jar" ./*
}
