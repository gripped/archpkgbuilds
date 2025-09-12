# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=qt6pas
_lazarus_tag=4_2
_lazarus_version=4.2.0
pkgver=6.2.10
pkgrel=1
pkgdesc='Free Pascal Qt6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('f17113a0ebff4f4228c5b9ad9a724f4e3c891a23b9b606a0a0a0ada934b07f61797c3f3b62f8ed1658ed11455a38cd159c55d02694006fb72c34d64102026966')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
