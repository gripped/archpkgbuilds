# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=openal
pkgname=(
  openal
  openal-examples
)
pkgver=1.24.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
url="https://github.com/kcat/openal-soft"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  alsa-lib
  cmake
  ffmpeg
  fluidsynth
  git
  jack
  libmysofa
  libpulse
  libsndfile
  ninja
  pipewire
  portaudio
  qt5-base
  sdl2
)
source=("git+https://github.com/kcat/openal-soft#tag=$pkgver")
b2sums=('557abe7c8ee739e236f36fa65db4a2a1ad5c3e92628c8ff822de1856f310a71a654398e7042c17b0dbceda73b773007e0982b9c5fb97be1bb3fc7da723a7b62b')

prepare() {
  cd openal-soft
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_LIBDIR=lib
  )

  cmake -S openal-soft -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_openal() {
  optdepends=(
    'qt5-base: alsoft-config GUI Configurator'
    'fluidsynth: MIDI rendering'
    'libmysofa: makemhr tool'
  )
  provides+=(libopenal.so)

  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/doc/openal" -m644 openal-soft/docs/*

  cd "$pkgdir"
  _pick examples usr/bin/al{direct,ffplay,hrtf,latency,loopback,multireverb}
  _pick examples usr/bin/al{debug,lafplay,play,record,reverb,stream,tonegen}
}

package_openal-examples() {
  pkgdesc+=" (example programs)"
  depends+=(
    "openal=$pkgver-$pkgrel"
    ffmpeg
    libsndfile
    sdl2
  )

  mv examples/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
