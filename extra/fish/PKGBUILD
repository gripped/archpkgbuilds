# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=4.0.6
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
sha512sums=('5c7acdea223717ac5fd2f761d38d060f8b757bd8204cd3adac1ddc8d419721eee990811f47d67a20c2d5fcbbce20c4153793f8c08aa5a50839796d6e21c436a9')
b2sums=('e9f845b3ed7abdefdd53e54814e113a9a28f568f81a647c7a1bf367fb14b75c4c4859422a40b8f09fc30810374f4d133906108bb9db9d6d3c5c678db95b32d67')

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
