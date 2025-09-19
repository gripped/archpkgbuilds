# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=4.0.8
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
sha512sums=('8e3c93b9702dc87600ddf2224f624b4f28de840b7968736a5ee524e775a596634d9588668974b4c972d2e1f0860ef79d81fc6889934b94db4524261d30a43e1f')
b2sums=('4be446f5b51d9017a3e74ff99f1a311b47e4e38e9538fcc0f3f8ce76dc04ab7a652e9778f2ab7d5a7ec07dfbd1b7ead275c80610f53d87889b8b328cfffe6bf4')

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
