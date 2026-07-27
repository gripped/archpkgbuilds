# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.9.5
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
sha512sums=('2370587fed19873ba22f50e947eaa7dbdd8d31fca09f425213b2a8e72cbc4eafcb51bdc7602c409e2eb63feb219c7e3b00152c04d53d4bf9418b33785f788e41'
            'SKIP')
b2sums=('73c87f3dfbffe69070045102c36699d4cf39c856ff8b7dd6fdeea01e19bf84655140629400cb56f173f09eae2739490f0475117c1843adc70d87c556ccf21464'
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
