# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=smplayer
pkgver=25.6.0
pkgrel=1
pkgdesc='Media player with built-in codecs that can play virtually all video and audio formats'
url='https://www.smplayer.info/'
arch=('x86_64')
license=('GPL')
depends=('glibc' 'qt5-base' 'qt5-declarative' 'mpv' 'libx11' 'zlib' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('smplayer-themes: icon themes collection'
            'smplayer-skins: skin themes collection'
#           'smtube: browse and play youtube videos'
            'youtube-dl: youtube videos and streaming'
            'yt-dlp: youtube videos and streaming'
            'mplayer: alternative multimedia engine')
source=(https://github.com/smplayer-dev/${pkgname}/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('0d40a2baad19f71f61774cdcbbbe243359a1b5ea2ba758f1b7f69f5f7ea7a87480391a109460aadd4473760095ac6d5ac3ade416a8bdba169a2ef7526fea285c')
b2sums=('78d3696b1589006442f9ec64ec840392fae9c62597289449b7b66dc5867b74a853d0e44ee7fabf56a2559248227aadac1861f325c25d38565549a142cb3dccc8')

prepare() {
  cd ${pkgname}-${pkgver}
  # make build reproducible, we compress ourselves
  sed '/gzip -9/d' -i Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}"
  make \
    PREFIX=/usr \
    DOC_PATH="\\\"/usr/share/doc/smplayer\\\"" \
    QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE \
    CFLAGS_EXTRA="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}" \
    all
}

package() {
  cd ${pkgname}-${pkgver}
  make \
    PREFIX=/usr \
    DOC_PATH=/usr/share/doc/smplayer \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ts=2 sw=2 et:
