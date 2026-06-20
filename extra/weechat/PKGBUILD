# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.9.1
pkgrel=1
pkgdesc="Fast, light and extensible IRC client (curses UI)"
arch=('x86_64')
url="https://www.weechat.org/"
license=('GPL-3.0-only')
depends=('curl'
         'gnutls'
         'cjson'
         'libgcrypt')
makedepends=('asciidoctor'
             'cmake'
             'enchant'
             'guile'
             'lua'
             'perl'
             'python'
             'ruby'
             'tcl')
optdepends=('enchant: spellchecker support'
            'guile: support for guile scripts'
            'lua: support for lua scripts'
            'perl: support for perl scripts'
            'python: support for python scripts'
            'ruby: support for ruby scripts'
            'tcl: support for tcl scripts')
source=("https://www.weechat.org/files/src/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha512sums=('3f773cfab52205162cef13f6f43336d88231cadd1a856b5aea3cf7395761aa7c701e8cecfae1d2d7997f77dff651c2d44e0a55cfd78f74b2d4629ce4a05d5489'
            'SKIP')
b2sums=('17d16daae03f6f7e2412c748cfcaa3a218af95130e71d36f944fb3e9a31092980aa954d58f2131744848929eef72a0a958c98403f778afc93e63a0ab16210095'
        'SKIP')
validpgpkeys=('A9AB5AB778FA5C3522FD0378F82F4B16DEC408F8') # WeeChat (signing key) <webmaster@weechat.org>

# cmake does not correctly handle CPPFLAGS, so kludge it in anyway:
# https://gitlab.kitware.com/cmake/cmake/-/issues/12928
CFLAGS+=" ${CPPFLAGS}"

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_MAN=ON
    -DENABLE_DOC=ON
    -DENABLE_DOC_INCOMPLETE=ON
    -DENABLE_ENCHANT=ON
    -DENABLE_JAVASCRIPT=OFF
    -DENABLE_PHP=OFF
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
