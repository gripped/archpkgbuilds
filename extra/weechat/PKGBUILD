# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=weechat
pkgver=4.7.2
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
sha512sums=('a56fe6c7eb05eadfde94780d5d636706e82726eb5bd80e76540025298c711f23d0193bd73bb324eb5255dbcdafbd91fc82e501ab782f5c13a795a9cbfb382435'
            'SKIP')
b2sums=('e4d546ad30f369467ee7e36028de1d5617f1d54ea44f89e0d49bc2748ffce0921790b7c6b90a524a3e7a2ef5a51b822e1d682016ca5a18e275502ed287fd739d'
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
