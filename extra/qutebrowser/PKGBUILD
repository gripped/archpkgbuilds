# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=qutebrowser
pkgver=3.6.2
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on Python and Qt"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL-3.0-only")
depends=("python-jinja" "python-pyqt6" "python-yaml" "qt6-base" "python-pyqt6-webengine")
makedepends=("asciidoc" "python-setuptools")
optdepends=("python-adblock: adblocking backend"
            "python-pygments"
            "pdfjs-legacy: displaying PDF in-browser")
options=(!emptydirs)
source=("https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz"
        "https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz.asc")
validpgpkeys=("27F3BB4FC217EECB858578AEEF7EE4D039690B7B")
sha256sums=('19f4a4565b92c1c080bcb3e55b8f502e6c966e54eb9d6f5082a9ded10cbc2493'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile all
}

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" PREFIX=/usr install
}
