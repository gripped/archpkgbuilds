# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.6.0.4
pkgrel=2
pkgdesc='The Swiss Army knife of sound processing tools'
arch=(x86_64)
url='https://codeberg.org/sox_ng/sox_ng/'
license=(GPL-2.0-only)
depends=(
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
  git
  lame
  libpulse
  libsndfile
  libvorbis
  opencore-amr
)
checkdepends=(time)
optdepends=(
  'alsa-lib: alsa plugin'
  'flac: flac plugin'
  'lame: mp3 plugin'
  'libpulse: pulse plugin'
  'libsndfile: caf, fap, mat4, mat5, paf, pvf, sd2, sndfile, w64 and xi plugins'
  'libvorbis: vorbis plugin'
  'opencore-amr: amr_nb and amr_wb plugins'
)
provides=(libsox.so)
source=(
  "$pkgname::git+https://codeberg.org/sox_ng/sox_ng.git#tag=sox_ng-${pkgver}"
  fix-install-dir.patch
)
sha512sums=('14294ff022f86bca0c2a852331a391efe285d218547e7607c916a357f88f7fb28dda10b4bdbad848362335a1c5341f3c317c7caf8c6c5b76f405ae13072f265c'
            '0431f400430ab9ca5685ff5438301489d4b493b342836f00bb9f08e2c28374ac8662ba68a6224a129e722ab33f6e015110caccc1db9a28fb13a729f47d8edc33')
b2sums=('aaf22e4a2c7fadd2ed87276743109189345fe2e715db1567943634864d77e8bccfc8b1e0926f3be453cb26e4a9fdc4e62fca4477325216b54d5179e8b1cb104a'
        'fd9042afa3d1cc6add7c4b053ad75784bdf6d163e803fff522b3e2e9b982246b1409573ca24a95cfe1466262199d9b3eac2b7ec328462cc2334368e718446860')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/fix-install-dir.patch"

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
