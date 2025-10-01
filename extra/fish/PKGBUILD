# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=4.1.1
pkgrel=1
pkgdesc='Smart and user friendly shell intended mostly for interactive use'
url='https://fishshell.com/'
arch=('x86_64')
license=('GPL-2.0-only AND BSD-3-Clause AND ISC AND MIT AND PSF-2.0')
depends=('glibc' 'gcc-libs' 'ncurses' 'pcre2')
makedepends=('cmake' 'git' 'jq' 'rust' 'python-sphinx')
checkdepends=('expect' 'procps-ng')
optdepends=(
  'python: man page completion parser / web config tool'
  'pkgfile: command-not-found hook'
  'groff: --help for built-in commmands'
  'mandoc: --help for built-in commmands (alternative)'
  'xsel: X11 clipboard integration'
  'xclip: X11 clipboard integration (alternative)'
  'wl-clipboard: Wayland clipboard integration'
)
options=(!lto)
install=fish.install
backup=(etc/fish/config.fish)
source=("${pkgname}::git+https://github.com/fish-shell/fish-shell#tag=${pkgver}")
#validpgpkeys=(003837986104878835FA516D7A67D962D88A709A) # David Adam <zanchey@gmail.com>
sha512sums=('2f7a92ec5db98b97d29623081b41f393f0be99897d49244da0a56b7055639a406a80a50b122154dbd3874b541acbb3ded2fadee8a179e3332b45e43ea7f36669')
b2sums=('ec13c8c9df16bd65d486703ef14876e671256cee448d24ca38fe2dbbb4f8cc215b6add17dd23461a419de5834d8f166ddf7f98a9ea31a28fdefc0bc196c0f21f')

build() {
  cd ${pkgname}

  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_DOCS=True
    -DFISH_USE_SYSTEM_PCRE2=ON
    -DWITH_GETTEXT=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}"

  make -C build VERBOSE=1
}

check() {
  cd ${pkgname}
  make test
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
