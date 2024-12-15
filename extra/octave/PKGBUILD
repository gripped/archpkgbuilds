# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave
pkgver=9.3.0
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
sha512sums=('b1e872911d5923f0ba30f3614810c6ef58176a9123fb7227e90e343d1f413fe9ba340d79c38b8b7b26aa474774b6024c060affba09f298da10635ea62dc377a4'
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
