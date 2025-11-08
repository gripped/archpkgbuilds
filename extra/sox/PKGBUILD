# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.6.1.2
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
sha512sums=('d9d38830129d095185c0d03a561f77e2789ad34600ad7b64c8170b801c0385961af488f98999a66a8df4a1fd0d684c95ddf410cf7921109390e6e121c403da8a')
b2sums=('71d5e437c2e32ee68fa7ddc8d532f96e096b31d0a2271553d68b42f8d1768d9c08840c03db279105e425937a71d544da7d57af1e1cd9d2bf5fd73a3856b54ad5')

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
