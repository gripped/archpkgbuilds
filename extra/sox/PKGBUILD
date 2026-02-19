# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.7.0.9
pkgrel=1
pkgdesc='The Swiss Army knife of sound processing tools'
arch=(x86_64)
url='https://codeberg.org/sox_ng/sox_ng/'
license=(GPL-2.0-only)
depends=(
  glibc
  ffmpeg
  file
  gsm
  libao
  libid3tag
  libltdl
  libmad
  libgcc
  libgomp
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
sha512sums=('2194501ecb5dd1d979c7d2d37e5f3cd985730c30fbd52d7c70f37f14a763793ad6e3e9712baf4f956321a165c1212a852055e75bc5928a78c4de5bf5daf4cdf4')
b2sums=('c565d5bf4f72052d0a06a50ef8e600f889298eece3b8db469a3a8939dfdd68d2f2d4d1852cfebb355afa3a7545866efbef758a4420bd541e0c7c63b9ad38c105')

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
