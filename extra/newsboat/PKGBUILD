# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=newsboat
pkgver=2.35
pkgrel=1
pkgdesc="RSS/Atom feed reader for text terminals"
arch=('x86_64')
url="https://newsboat.org/"
license=('MIT')
depends=('curl' 'hicolor-icon-theme' 'json-c' 'libxml2' 'sqlite' 'stfl')
makedepends=('asciidoctor' 'rust' 'swig')
optdepends=(
  'buku: for bookmark-buku.sh'
  'kitty: for kitty-img-pager.sh'
  'perl: for pinboard.pl'
  'python: for exportOPMLWithTags.py'
  'ruby: for feedgrabber.rb, heise.rb, and slashdot.rb'
)
replaces=('newsbeuter')
options=('!makeflags' '!lto')
changelog=$pkgname.changelog
source=("https://newsboat.org/releases/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('f4f003f6ca38e44c0fef01fb6bc8c5ba6b53589c7c87db7b0cc2284e018db6c4'
            'SKIP')
validpgpkeys=('B8B1756A0DDBF0760CE67CCF4ED6CD61932B9EBE') # Newsboat project <newsboat@googlegroups.com>

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver

  make prefix=/usr
  make doc
}

package() {
  cd $pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
