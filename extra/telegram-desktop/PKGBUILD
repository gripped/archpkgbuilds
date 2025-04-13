# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop
pkgver=5.13.1
pkgrel=3
pkgdesc='Official Telegram Desktop client'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'kcoreaddons' 'openh264')
makedepends=('cmake' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'libtg_owt' 'gobject-introspection' 'boost' 'glib2-devel')
optdepends=('geoclue: geoinformation support'
            'geocode-glib: geocoding support'
            'geocode-glib-2: geocoding support'
            'webkit2gtk: embedded browser features provided by webkit2gtk'
            'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
            'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
         qt-6.9.patch)
sha512sums=('6d15ad0641e0e47e4d48869885c63e6d1ddbfb5461c121cf33ac77d231a6fc77a6eb5333ad7b76d3aa2e1111d9a5f58846fae83cd36886838d6791dbfaa65929'
            'c9ed195bec0cad9331d3414941402b11d45455d1a947d02eac718ba9809329b26aca7ed7ee7a7224f820ed7239a2a2da375731f04bcba2482021e3ec32612f96')

prepare() {
  patch -d tdesktop-$pkgver-full/Telegram/lib_base -p1 < qt-6.9.patch
}

build() {
  CXXFLAGS+=' -ffat-lto-objects'

  # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
