# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=newsboat
pkgver=2.38
pkgrel=1
pkgdesc="RSS/Atom feed reader for text terminals"
arch=('x86_64')
url="https://newsboat.org/"
license=('MIT')
depends=('curl' 'hicolor-icon-theme' 'json-c' 'libxml2' 'sqlite' 'stfl')
makedepends=('asciidoctor' 'git' 'rust' 'swig')
optdepends=(
  'buku: for bookmark-buku.sh'
  'kitty: for kitty-img-pager.sh'
  'perl: for pinboard.pl'
  'python: for exportOPMLWithTags.py'
  'ruby: for feedgrabber.rb, heise.rb, and slashdot.rb'
)
replaces=('newsbeuter')
options=('!makeflags' '!lto')
source=("git+https://github.com/newsboat/newsboat.git#tag=r${pkgver}")
sha256sums=('eed422ca81e234d83d2720f6b393798df62337648bc1739fd8b767407d7cf802')
#validpgpkeys=('B8B1756A0DDBF0760CE67CCF4ED6CD61932B9EBE') # Newsboat project <newsboat@googlegroups.com>

prepare() {
  cd $pkgname

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname

  make prefix=/usr
  make doc
}

package() {
  cd $pkgname

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
