# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.13.3
pkgrel=3
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
source=(https://data.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz{,.asc}
        399b6f07.patch)
sha512sums=('c4698b1dae844328b6b636063871c6f5ddb306270d6520d43df7c38269c432e9eb36fab9e1a3cf8e54a7570bf9f5b8ba48f85b3bb1b28c8b8fe0ec516f084934'
            'SKIP'
            '4f4890da0d466cb8ca59b8754e4bdba3a6b39f7614e270928e7d4a4d39eaaa07a9b24de49293c7cb7313ce07f7bb7e7bf5141addc444488b6d3c609fe548b87a')
b2sums=('0d62188feec6595b9b5439ffd394d406b85fb2941ed3c14d40451c31113168c58f2bb146f4de5d5f3c355fdb6a0ab494dc9fe3ca712c6a0c61a3b29f661a8605'
        'SKIP'
        'c875621085dba184847a9ce497102cfbc5a56212edec95948b5baa5de7e47a81b7c506eb745e8fa1ff1e41fe70acac4d147509c1e1a695f188915ed7e0b943bf')
# NOTE: OpenPGP signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../399b6f07.patch # Fix tests with python 3.14
}

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
