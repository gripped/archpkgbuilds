# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: fancris3 <fancris3 at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=terminator
pkgver=2.1.5
pkgrel=2
pkgdesc='Terminal emulator that supports tabs and grids'
arch=('any')
url='https://github.com/gnome-terminator/terminator'
license=('GPL-2.0-only')
depends=(
    'gsettings-desktop-schemas'
    'libkeybinder3'
    'libnotify'
    'python'
    'python-cairo'
    'python-configobj'
    'python-dbus'
    'python-gobject'
    'python-psutil'
    'vte3'
    'xdg-utils'
)
makedepends=(
    'intltool'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc}
        0001-fixed-validate-module-import-for-newer-version-of-co.patch)

validpgpkeys=('6FBDB41587919A0F4BA96EBA9A358BAB04A4ED27'  #Markus Frosch <markus@lazyfrosch.de>
              'D11A7596F61705480C711598F2FAC7C7BAE930A5') #Matt Rose <mattrose@folkwolf.net>
sha512sums=('27dc3e9cbe7074e3236b6a0fda9460f4b13492010ad37500c0e68bf08cc1949d44347089671259313853014f708cde4be1321b33edf6b5494256b75386616e56'
            'SKIP'
            'da609bbb1f2fce64bd345ec43c05f6b8d76046cfbd1be764d6fcd555d306dfca1dd5786b0fc65c0984e49a85454c9eeabf5a1f8c960412c14a97c5350912f8a9')
b2sums=('0a1fd90ac06a61b584cbc621a85413dea4ea29ba8d3fc217e80f394f77cd6a8ce65ae8b9bdbabbf1ea96b390f3b0d4986bde691088fa85bc18701cd6f89fb72c'
        'SKIP'
        '7cde90cefde34346ef20b50ebd5b930cb47df650c649e199adbb1b6235db0b40c0c2ad2b0e30bc764d52469357ce0b0424648f70da93b10d39ed0793cbbfe648')

prepare () {
    cd "${pkgname}-${pkgver}"

    # Fix for python configobj validate
    patch -Np1 < $srcdir/0001-fixed-validate-module-import-for-newer-version-of-co.patch

    # Remove pytest-runner from setup_requires
    sed -i '/pytest-runner/d' setup.py
}

build() {
    cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
