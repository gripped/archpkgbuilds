# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.7.0
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
  autoconf-archive
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
sha512sums=('88076f0e37783d38fa50296bdd6925713cbd5aa828f9e8c2bfe07f6bdd1a868c9d039e7ef20a2cfe8850083485a42bbd0c53e1c61b6e622fa58dc8210c2a56f9')
b2sums=('ae7836c35110966f6758d4206fe842f3abead3002ea829555d9ecf074d1ce5a6899d4457e0655952a50eb52b0ca0d7956e8511a6ab3a921fcf5927a257bbc337')

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
