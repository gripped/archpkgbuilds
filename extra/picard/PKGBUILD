# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=3.0.5
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL-2.0-or-later)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-discid
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt6
  python-pygit2
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt6-multimedia: media player toolbar'
  'qt6-translations: full UI translation'
)
source=(https://data.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('f37b0eb86cb56784a58b6a0184804aa8727876804c436fbbe0361fcdff3ac13f5106f6a948beed8590ff42b5a6313d92e9da39ddf963703ec3faf68307187ccb'
            'SKIP')
b2sums=('1a38af0ae682415c1e6838f4e9b48f828b40e19e93df773d863fb22b491d4c0f71316d88769afadcca452696bd4d8a8c8cb87cda5d86c0198815ca3f21927270'
        'SKIP')
# NOTE: OpenPGP signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

build() {
  cd $pkgname-$pkgver
  PICARD_DISABLE_AUTOUPDATE=1  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
