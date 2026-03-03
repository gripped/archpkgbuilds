# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: rebel <novakpetya at yahoo dot co dot uk>

pkgname=qt5pas
_lazarus_tag=4_6
_lazarus_version=4.6.0
epoch=1
pkgver=1.2.16
pkgrel=2
pkgdesc='Free Pascal Qt5 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt5/cbindings'
license=('LGPL3')
depends=('qt5-base' 'qt5-x11extras')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('9f59a21d38b36416757b6572ebfa10dba13457fc7a5fd9c91550ea2d1b1daed7c9cc292bd7069a8dd1ac3a8ca2c8231f0456a0fe89f011a92d07a861e0f14684')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt5/cbindings"
    qmake-qt5 "QT += x11extras"
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt5/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
