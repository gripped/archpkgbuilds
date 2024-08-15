# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.3.6
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
sha512sums=('d97223f733b4b5233f9ddcd97cb1011a2ad9edc72f17d1e3670cc843848783a6c41ff8edc12edf33eda3e6f0b1bd8898a638cf9dc1a1d2c4996a7f063d473742'
            'SKIP')
b2sums=('47809deba9683c8fd40cc78b54fe63cafbf5ca3e2b4dd96b1fe597f4f425ea682c3c8d3d634aae34a3b23e7cdddc97537848320e2e54d9372a17502dad022af9'
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
