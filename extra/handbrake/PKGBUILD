# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake' 'handbrake-cli')
pkgver=1.7.1
pkgrel=3
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
_commondeps=('libxml2' 'libass' 'libvorbis' 'opus' 'speex' 'libtheora' 'lame'
             'x264' 'jansson' 'libvpx' 'libva' 'numactl' 'bzip2' 'gcc-libs'
             'zlib' 'xz' 'libjpeg-turbo')
_guideps=('gst-plugins-base' 'gtk3' 'librsvg')
# git included as a build dependency for bundled x265 to work
# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=275546#c0
makedepends=('python' 'nasm' 'wget' 'cmake' 'meson' 'git'
             "${_commondeps[@]}" "${_guideps[@]}")
options=('!lto') # https://bugs.archlinux.org/task/72600
source=(https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2{,.sig}
        $pkgname-fix-vp9-encoding.patch::https://github.com/HandBrake/HandBrake/commit/a582ab0170f5.patch)
sha256sums=('733e42c8f254f6c2f8f6b40f0d3572fd49167ebf30742beae605effa16939edc'
            'SKIP'
            '8437103ac3e15a067a1488f313d4114b984f89be9e1295e616da660a863a960c')
validpgpkeys+=('1629C061B3DDE7EB4AE34B81021DB8B44E4A8645') # HandBrake Team <developers@handbrake.fr>

prepare() {
  cd HandBrake-$pkgver
  patch -Np1 -i ../$pkgname-fix-vp9-encoding.patch
}

build() {
  cd HandBrake-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-qsv
  make -C build
}

package_handbrake() {
  pkgdesc="Multithreaded video transcoder"
  depends=('desktop-file-utils' 'hicolor-icon-theme'
           "${_commondeps[@]}" "${_guideps[@]}")
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd HandBrake-$pkgver/build

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=('intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd HandBrake-$pkgver/build
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
