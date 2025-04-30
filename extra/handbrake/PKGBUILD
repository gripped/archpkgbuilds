# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake' 'handbrake-cli')
pkgver=1.9.2
pkgrel=3
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL-2.0-only')
_commondeps=('libxml2' 'libass' 'libvorbis' 'opus' 'speex' 'libtheora' 'lame'
             'x264' 'jansson' 'libvpx' 'libva' 'numactl' 'bzip2' 'gcc-libs'
             'zlib' 'xz' 'libjpeg-turbo')
_guideps=('gst-plugins-base' 'gtk4' 'librsvg')
# git included as a build dependency for bundled x265 to work
# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=275546#c0
makedepends=('python' 'nasm' 'wget' 'cmake' 'meson' 'git'
             "${_commondeps[@]}" "${_guideps[@]}")
options=('!lto') # https://bugs.archlinux.org/task/72600
source=("git+https://github.com/HandBrake/HandBrake.git?signed#tag=${pkgver}")
sha256sums=('0b9d3a9e8862ec013fe9df1f99e3a7ec8ce75233ddf7a6af1ce620f5baf49c65')
validpgpkeys=('1629C061B3DDE7EB4AE34B81021DB8B44E4A8645' # HandBrake Team <developers@handbrake.fr>
              'D57F6026431D68DFFB942F0D5759C8A0D1C34D47' # Damiano Galassi <damiog@gmail.com>
)

prepare() {
  cd HandBrake

  # Update bundled svt-av1 to fix build with current cmake
  git cherry-pick -n 75f9c84c140c8841cfe1324ef59452025899ad8b \
                     2012ab9e674a744c1366b96b8cf2720e75670248 \
                     eb3a7e7c01313d687ebd487b59e08c700fe753d1 \
                     f9e7678bd4e42232188315e842e32387af9ac3ca

  # Update bundled x265 to fix build with current cmake
  git cherry-pick -n a53d20a48bfca3c7dbf4f50710505c65e4334c89
}

build() {
  cd HandBrake

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
              'gvfs: for CD/DVD drive access'
              'intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd HandBrake/build

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=('intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd HandBrake/build
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
