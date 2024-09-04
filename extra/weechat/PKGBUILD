# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.4.1
pkgrel=2
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
sha512sums=('75b1fc21674229f11f9d5d049b663dee77e65529b5dfe62744e7afd0f0854afa4344b56f26d91fe9378ccece932e05e57e9bce4e1d7515d4d26fdffbf2f2a55b'
            'SKIP')
b2sums=('71436cf291271690337a918907b8de411f9f8f0c80ffd8d20aa035ee2121917c62a6d9704b28fac8efa4e4b7067eb0c834746e07083abe29ddf679ee3261b658'
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
