# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=qt6pas
_lazarus_tag=3_8
_lazarus_version=3.8.0
pkgver=6.2.8
pkgrel=1
pkgdesc='Free Pascal Qt6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('c3b78f50fd78fba9a0f171136772303dc6ecb2ba7fe1f587cae6c99091129bcab87855fc15edb37aee7d9f6d7e14af987882bc0073e4fdfa04518da34a2427b1')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
