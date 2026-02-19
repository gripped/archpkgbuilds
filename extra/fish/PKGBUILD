# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=4.5.0
pkgrel=2
pkgdesc='Smart and user friendly shell intended mostly for interactive use'
url='https://fishshell.com/'
arch=(x86_64)
license=('GPL-2.0-only AND BSD-3-Clause AND ISC AND MIT AND PSF-2.0')
depends=(glibc libgcc pcre2)
makedepends=(cmake git jq rust python-sphinx)
checkdepends=(expect procps-ng)
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
sha512sums=('bf06ac239c4755cb87e5450051737d87dc3c681464a19646029ec9037577ec21d6c7f41a4beaa550c718f0c568c4369869e9369d6ed3c39f0a05d47422704c22')
b2sums=('5df0d8270b7372a5a4ee9dd91466a2ace576d93a95cc18bd1c38d47b89298f009c2a84fa42856abd6260836ab56207a7939f3c4f5ef7b1818af8513a60e0394e')

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
  make test
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
