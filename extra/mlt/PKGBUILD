# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: funkyou <spamopfer@nickname.berlin.de>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mlt
pkgver=7.18.0
pkgrel=2
pkgdesc='An open source multimedia framework'
arch=(x86_64)
url='https://www.mltframework.org'
license=(GPL)
depends=(libebur128)
optdepends=('sdl_image: SDL1 plugin'
            'sdl2: SDL2 plugin'
            'libsamplerate: libavresample plugin'
            'sox: SOX (Audio Swiss Army Knife) plugin'
            'ffmpeg: ffmpeg plugin'
            'vid.stab: video stabilize plugin'
            'qt5-svg: Qt5 plugins'
            'qt6-svg: Qt6 plugin' 'qt6-5compat: Qt6 plugin'
            'jack: JACK sound output plugin'
            'ladspa: LADSPA plugins'
            'libexif: auto rotate plugin'
            'frei0r-plugins: for additional effects'
            'movit: opengl plugin'
            'opencv: openCV plugin'
            'rubberband: audio pitch plugin'
            'gdk-pixbuf2: gdk plugin'
            'pango: gdk plugin'
            'rtaudio: rtaudio plugin'
            'python: python bindings')
makedepends=(cmake ladspa frei0r-plugins libdv sdl_image libsamplerate sox ffmpeg vid.stab qt5-svg qt6-svg qt6-5compat
             jack libexif python swig movit eigen opencv rubberband gdk-pixbuf2 pango rtaudio imagemagick)
source=(https://github.com/mltframework/mlt/releases/download/v$pkgver/mlt-$pkgver.tar.gz
        https://github.com/mltframework/mlt/commit/52c5bde6.patch
        https://github.com/mltframework/mlt/commit/1d3669e6.patch
        https://github.com/mltframework/mlt/commit/2266e5c8.patch
        https://github.com/mltframework/mlt/commit/2df4fc8e.patch
        https://github.com/mltframework/mlt/commit/b4943c55.patch)
sha256sums=('9c57da14fbf3cb9c23b867b36f038aac7978c159ba0e8d8ac90e31c66878d115'
            '2162fe44964ff6946403510e2388ef0cb3dce4f2837b187aa6e83f7906a345a6'
            'a7f3d8da9126b0b34a3df3334c7f6b93218eef0ed86fbbc6ec058e8bd0075a19'
            '3d2aa691ca10aeeb637a931503b744e35743a13e01beab33e2e725f0987628d9'
            '8496448b49ecd5de12ce694db8064bfbd8adc5eaf7cd67d89487e5d69899d67a'
            'f6b102329cf8439bad833aa40b5b8417805a5b8ee560cbf082fed013ecdfca13')

prepare() {
# Fix crashes
  for _patch in 52c5bde6 1d3669e6 2266e5c8 2df4fc8e b4943c55; do
    patch -d $pkgname-$pkgver -p1 < $_patch.patch
  done
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMOD_OPENCV=ON \
    -DMOD_GLAXNIMATE=ON \
    -DMOD_QT6=ON \
    -DSWIG_PYTHON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
