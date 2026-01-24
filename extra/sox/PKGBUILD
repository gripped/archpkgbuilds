# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.7.0.5
pkgrel=1
pkgdesc='The Swiss Army knife of sound processing tools'
arch=(x86_64)
url='https://codeberg.org/sox_ng/sox_ng/'
license=(GPL-2.0-only)
depends=(
  glibc
  ffmpeg
  file
  gcc-libs
  gsm
  libao
  libid3tag
  libltdl
  libmad
  libpng
  opusfile
  twolame
  wavpack
  zlib
)
makedepends=(
  alsa-lib
  flac
  fftw
  git
  lame
  libpulse
  libsndfile
  libvorbis
  libogg
  opencore-amr
  speexdsp
)
checkdepends=(time)
optdepends=(
  'alsa-lib: alsa plugin'
  'flac: flac plugin'
  'fftw: fftw support'
  'lame: mp3 plugin'
  'libpulse: pulse plugin'
  'libsndfile: caf, fap, mat4, mat5, paf, pvf, sd2, sndfile, w64 and xi plugins'
  'libvorbis: vorbis plugin'
  'libogg: ogg plugin'
  'opencore-amr: amr_nb and amr_wb plugins'
  'speexdsp: speexdsp plugin/effect'
)
provides=(libsox.so libsox_ng.so)
source=("$pkgname::git+https://codeberg.org/sox_ng/sox_ng.git#tag=sox_ng-${pkgver}")
sha512sums=('a89bd641f5056d9e7dc3e5156ed598711825a50323164900f71da4c8dcaa7d5ca5e5fa42eee474e6372ba7f35f22b38e3f7daff8f7cd072a7aa9fa91fef57888')
b2sums=('cc70d7d00a04a29ae97c66e4ede9f9b7d9eb58afae477abc0e102cbdb81983f411a1b0b05c525fa1c5bcf5372d3405e4bc87080683e0be8c46028104365b1a90')

prepare() {
  cd "$pkgname"

  autoreconf -vfi
}

build() {
  cd "$pkgname"

  local configure_flags=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --enable-replace
    --with-distro="Arch Linux"
    --with-ffmpeg
  )

  ./configure "${configure_flags[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make all README
}

check() (
  cd "$pkgname/src"

  export DESTDIR="${PWD}/tmp"
  mkdir -p "${DESTDIR}"

  export LD_LIBRARY_PATH="${DESTDIR}/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

  make sox_sample_test
  make install
  make installcheck
)

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}" install

  # documentation
  install -vDm644 \
    -t "$pkgdir/usr/share/doc/$pkgname" \
    AUTHORS ChangeLog README
}
