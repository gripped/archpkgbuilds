# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=3.6.2
pkgrel=1
pkgdesc='Smart and user friendly shell intended mostly for interactive use'
url='https://fishshell.com/'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'gcc-libs' 'ncurses' 'pcre2')
optdepends=('python: man page completion parser / web config tool'
            'pkgfile: command-not-found hook')
makedepends=('cmake' 'python-sphinx')
checkdepends=('expect' 'procps-ng')
install=fish.install
backup=(etc/fish/config.fish)
source=(https://github.com/fish-shell/fish-shell/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz{,.asc})
validpgpkeys=(003837986104878835FA516D7A67D962D88A709A) # David Adam <zanchey@gmail.com>
sha256sums=('a21a6c986f1f80273895ba7e905fa80ad7e1a262ddb3d979efa443367eaf4863'
            'SKIP')
sha512sums=('ee28b49a8c19cdc2613ed0b729eb6c8b686062a5e505357b045b67a64c9e4f5f6a308c58c6756a39c5edc4a9237afee9fc25763ce6b73b30cdb5ee5f21b2ac5d'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_DOCS=True \
    -Wno-dev
  make -C build VERBOSE=1
}

check() {
  cd ${pkgname}-${pkgver}
  make -C build test
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
