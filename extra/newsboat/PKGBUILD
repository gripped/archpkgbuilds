# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=newsboat
pkgver=2.44
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
source=("git+https://github.com/newsboat/newsboat.git?signed#tag=r${pkgver}")
sha256sums=('8e6ab6a8af53ab4c461e7af1e4392cf05738b9a9160ad7419358d23bab40db83')
validpgpkeys=('B8B1756A0DDBF0760CE67CCF4ED6CD61932B9EBE') # Newsboat project <newsboat@googlegroups.com>

prepare() {
  cd $pkgname

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export CXXFLAGS+=" -fpermissive"

  cd $pkgname

  make prefix=/usr
  make doc
}

package() {
  cd $pkgname

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
