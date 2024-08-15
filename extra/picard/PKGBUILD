# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.12.1
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL-2.0-or-later)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-dateutil
  python-discid
  python-fasteners
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt5
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
  'qt5-multimedia: media player toolbar'
  'qt5-translations: full UI translation'
)
source=(https://data.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('d9a9f574d7a4ca981cd224068c59eef5f3acdab8e8f84a3d5c5c4428d57c49e706899f039e246c0bdbe85206b1777c8211e54d02982bd163c7bbcad5126b3d11'
            'SKIP')
b2sums=('0015b0c378088f2cd2d7f2449a41c544b9f4cb4e521e9728a872f37ab21815f492a8a80886ce294e17406808cb965968962b8fde6625907f324c50b3ba53d160'
        'SKIP')
# NOTE: OpenPGP signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
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
