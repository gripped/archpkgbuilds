# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=qutebrowser
pkgver=3.5.0
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on Python and Qt"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL-3.0-only")
depends=("python-jinja" "python-pyqt6" "python-yaml" "qt6-base" "python-pyqt6-webengine")
makedepends=("asciidoc" "python-setuptools")
optdepends=("python-adblock: adblocking backend"
            "python-pygments"
            "pdfjs: displaying PDF in-browser")
options=(!emptydirs)
source=("https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz"
        "https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz.asc")
validpgpkeys=("27F3BB4FC217EECB858578AEEF7EE4D039690B7B")
sha256sums=('fa142c8d1c2825b068b71b3604a8b2d682e2ed84a14c3e68b6de7844331d80bb'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile all
}

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" PREFIX=/usr install
}
