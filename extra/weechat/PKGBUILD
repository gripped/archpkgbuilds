# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer : Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.1.3
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
sha512sums=('e33c29ddcaa49aba94f0a7ceada9fd0df0ea63a843ab752eb35d8b1a68ca151ae8d58ab66ec18f82d7ba7846cacaef8a19edcbf4e70f6ae10dd9a3cf09955bb0'
            'SKIP')
b2sums=('b810dc49f817f35b121037663e36dded1dd1f56b8ea7db6b18d60731993efeca956f8ec871001ced480094f1fc2e63c276047c44d1fc1ec27bb13622be1ffc84'
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
