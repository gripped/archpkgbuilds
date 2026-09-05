# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=4.9.1
pkgrel=1
pkgdesc='Smart and user friendly shell intended mostly for interactive use'
url='https://fishshell.com/'
arch=(x86_64)
license=('GPL-2.0-only AND BSD-3-Clause AND ISC AND MIT AND PSF-2.0')
depends=(glibc libgcc pcre2)
makedepends=(cmake git jq rust python-sphinx)
checkdepends=(expect procps-ng python-pexpect)
optdepends=(
  'python: man page completion parser / web config tool'
  'pkgfile: command-not-found hook'
  'groff: --help for built-in commmands'
  'mandoc: --help for built-in commmands (alternative)'
  'xsel: X11 clipboard integration'
  'xclip: X11 clipboard integration (alternative)'
  'wl-clipboard: Wayland clipboard integration'
)
install=fish.install
backup=(etc/fish/config.fish)
source=("${pkgname}::git+https://github.com/fish-shell/fish-shell#tag=${pkgver}")
#validpgpkeys=(003837986104878835FA516D7A67D962D88A709A) # David Adam <zanchey@gmail.com>
sha512sums=('34acd2a405ad2f550e1a98b272be3cff4fcc521ac3b1edf1db3af4dcc1dfeb768e9405bd5d2158a8bda1a6f1238eaf828f954ad79270c6e41da062d8b31e966d')
b2sums=('ecadf36adf65eac734c16ebd300875510cf106e9d4bb7c920794384a2a1735bb01bf324392b1da2087d35deae9b3358736732b83260aac89ee62ee051c8ae5f8')

build() {
  cd ${pkgname}

  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_BUILD_TYPE=Release
    -D WITH_DOCS=ON
    -D FISH_USE_SYSTEM_PCRE2=ON
    -D WITH_MESSAGE_LOCALIZATION=ON
    -W no-dev
  )
  cmake "${cmake_options[@]}"

  make -C build VERBOSE=1
}

check() {
  cd ${pkgname}

  cmake --build build --target fish_run_tests
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
