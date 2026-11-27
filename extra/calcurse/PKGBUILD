# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: wain <wain.at.gmx.net>

pkgname=calcurse
pkgver=4.9.1
pkgrel=1
pkgdesc='A text-based personal organizer'
arch=('x86_64')
url='https://calcurse.org/'
license=('BSD')
depends=('ncurses')
optdepends=(
  'python: for CalDAV support'
  'python-httplib2: for CalDAV support'
  'python-pyparsing: for CalDAV support'
  'python-oauth2client: for Google Calendar support'
)
source=("https://calcurse.org/files/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('34cbccff833ed4b0b53c0e6daf768ff03a1a462677ed40e9ed0eb463a8bf5aff4c9f23c6c54e04f37f84d3c85645a22a7671f477a2164c498fa1c64cedd13281'
            'SKIP')
b2sums=('199c38f0860df6e0f41fab3bf4bc25832f8c6deb4ce2337dd1d664b410adfc861da405aebed64cc3960ea93a91ddd580de467e211f06c98dc9ec802628bfaf50'
        'SKIP')
validpgpkeys=('2E36D8620221482FC45CB7F2A91764759326B440') # Lukas Fleischer <lfleischer@calcurse.org>

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --enable-docs \
    --without-asciidoc \
    --prefix=/usr \
    --mandir=/usr/share/man

  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
