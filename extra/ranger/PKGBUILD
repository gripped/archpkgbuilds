# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Roman Zimbelmann <romanz@lavabit.com>

pkgname=ranger
pkgver=1.9.4
pkgrel=3
pkgdesc='Simple, vim-like file manager'
arch=('any')
url='https://ranger.github.io'
license=('GPL')
depends=('python')
optdepends=(
    'atool: for previews of archives'
    'elinks: for previews of html pages'
    'ffmpegthumbnailer: for video previews'
    'highlight: for syntax highlighting of code'
    'imagemagick: auto-rotate image previews based on EXIF data'
    'libcaca: for ASCII-art image previews'
    'lynx: for previews of html pages'
    'mediainfo: for viewing information about media files'
    'odt2txt: for OpenDocument texts'
    'perl-image-exiftool: for viewing information about media files'
    'poppler: for pdf previews'
    'python-chardet: in case of encoding detection problems'
    'python-pillow: for in-terminal preview of images in Kitty'
    'sudo: to use the "run as root"-feature'
    'transmission-cli: for viewing bittorrent information'
    'ueberzug: for previews of images'
    'w3m: for previews of images and html pages')
checkdepends=('python-pytest')
makedepends=(python-{build,installer,wheel}
             python-setuptools)
source=(https://ranger.github.io/${pkgname}-${pkgver}.tar.gz{,.sig}
        ranger-1.9.4-fix-ncurses-endwin-error.patch)
sha512sums=('18cd1d66838a5f85176e6b7502521a7e449aaa0b12e97d62142d39f980c529c5b97a50f6fb8a65adb64612fa80450b1e13047327f7bcc005a494af4ab321e4d4'
            'SKIP'
            'c1bbe01c287527ead05f627dbb3de678d3d6c170dd1d3ae2a719592c1b56463838664ee8b2470310f0a658d252496a6f0005502259cd5bc1e7abf7f35c24f97a')
validpgpkeys=('1E9B36EC051FF6F7FFC969A7F08CE1E200FB5CDF' # Roman Zimbelmann <hut@hut.pm> (@hut)
              '30193C49CB39CD27008246ADE5902A52B247B8DE' # Wojciech Siewierski <wojciech.siewierski@onet.pl>
              '66FA95C0F1619BDA520A41F60D63346A5D15D055') # Toon Nolten <toonn@toonn.io> (@huterich)

prepare() {
  cd "${pkgname}-${pkgver}"
  # fixes https://github.com/ranger/ranger/issues/1853
  # upsteam fix was never released:
  # https://github.com/ranger/ranger/commit/2241cac899536a94c032a58bb7f1bf921980687e
  sed -i 's/xdg-open -- /xdg-open /' "ranger/config/rifle.conf"

  patch -Np1 < ../ranger-1.9.4-fix-ncurses-endwin-error.patch
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build -wn
}

check() {
  cd ${pkgname}-${pkgver}
  local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="$PWD/lib.linux-$CARCH-cpython-$_pyver"
  export TERM=linux
  pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer -d "$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
