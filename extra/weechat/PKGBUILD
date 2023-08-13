# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer : Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.0.3
pkgrel=1
pkgdesc="Fast, light and extensible IRC client (curses UI)"
arch=('x86_64')
url="https://www.weechat.org/"
license=('GPL')
depends=('gnutls' 'curl' 'libgcrypt')
makedepends=('asciidoctor' 'cmake' 'enchant' 'guile' 'lua' 'perl' 'python'
             'ruby' 'tcl')
optdepends=('enchant: spellchecker support'
            'guile: support for guile scripts'
            'lua: support for lua scripts'
            'perl: support for perl scripts'
            'python: support for python scripts'
            'ruby: support for ruby scripts'
            'tcl: support for tcl scripts')
source=("https://www.weechat.org/files/src/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha512sums=('b1287fa78d0cd8cfcb0f1726cf5289e130182f73b83f090ea6b4faec9467011b38c7bc4ca334d017bea362cec6d2636c20715c7ed9991299a0d7f6bdb60ca2a3'
            'SKIP')
b2sums=('45badd8774118f1b8d99d083af01dd14e36213aca5612067279904b0c37c0fdbbead68fba755b95b1f1547e9addb41e56346c07cbb7241c3308f68231d2fb17c'
        'SKIP')
validpgpkeys=('A9AB5AB778FA5C3522FD0378F82F4B16DEC408F8') # WeeChat (signing key) <webmaster@weechat.org>

# cmake does not correctly handle CPPFLAGS, so kludge it in anyway:
# https://gitlab.kitware.com/cmake/cmake/-/issues/12928
CFLAGS+=" ${CPPFLAGS}"

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_MAN=ON \
        -DENABLE_DOC=ON \
        -DENABLE_DOC_INCOMPLETE=ON \
        -DENABLE_ENCHANT=ON \
        -DENABLE_JAVASCRIPT=OFF \
        -DENABLE_PHP=OFF \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
