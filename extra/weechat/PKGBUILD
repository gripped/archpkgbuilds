# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.7.0
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
sha512sums=('6ca31f0ee23dbc2cd47645c1b4e57f071908b00b1f01bee401e9fb49cc868b782285499d988f8f8ba5e1a92e31a9fa5ba0eeae153eeefc14ba20c420bfbeb0e6'
            'SKIP')
b2sums=('e5b085a5b6d6bc2e317f359095322ce4eca344a0eead9bf7663a81474607c393ddedc967baf60054a32272f556fdfcf70f4a93aaf4e6667c496f2811757d5015'
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
