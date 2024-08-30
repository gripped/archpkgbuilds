# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.12.2
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
sha512sums=('d06583c82737e6b5f26a639f24ecec115f29a9df7498e2632e084bcfc31f13c72965bd862c19c496fe0539c8987812d53ed9298522e37989c733af2f7ecface1'
            'SKIP')
b2sums=('f9f8fc5ffe424ce2a9aa154994e7ec1adf61a61a94769fb36d715de9ec84f1dac2d49f27d13900354adad7dcb936d62a2eba429e4ccb20dc5d6849d7f4b22adc'
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
