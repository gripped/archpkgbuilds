# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Jonas Hahnfeld <hahnjo@hahnjo.de>

pkgname=lilypond
pkgver=2.24.2
pkgrel=3
pkgdesc="Music engraving program, devoted to producing the highest-quality sheet music possible"
arch=(x86_64)
url="https://lilypond.org"
license=(FDL1.3 GPL3 OFL)
groups=(pro-audio)
depends=(gcc-libs
         ghostscript
         glibc
         gsfonts)
makedepends=(dblatex
             fontconfig
             fontforge
             freetype2
             glib2
             guile2.2
             imagemagick
             pango
             python
             rsync
             t1utils
             texinfo
             texlive-basic
             texlive-bin
             texlive-binextra
             texlive-fontutils
             texlive-langcyrillic
             texlive-metapost
             texlive-xetex
             zip)
optdepends=('python: for lilypond-book and other scripts'
            'tex-gyre-fonts: for extra fonts'
            'ttf-dejavu: for extra fonts')
source=("https://lilypond.org/downloads/sources/v${pkgver%.*}/$pkgname-$pkgver.tar.gz"
        "lilypond-gs.patch::https://gitlab.com/lilypond/lilypond/-/commit/1695a4d6.patch")
sha512sums=('14a37e3346cad2fe78a9ce7189d21797c9d78016c675b6a20ae25de7bf3de2916c6982ef753b0d051600c0ac15317a8ecb423746be4419db023b6eb829dfc3de'
            'c2ca6e8bfb334120c1e76db1e676ec07558ce224c0467730f31f6ddea6efb75bdcba72f84b215316f02875bd99763f02c9d8d32339636c8f50d26eaf4c8e8d34')
b2sums=('2d69d1d09d51e44cdf635b02acca191180105dad7dd1bab5933606c2864c8a272bb28472ff429d462ce837252f5fc8223d796f28a2693c0bdd0c81ab0c1502ce'
        'a9518914751704ac52b30ff0def8943d3d3ed4a70794296149d55be51156c14763fc34d3badfa0a54bd185f5dc15c0050406f9e25a2c65e69a27cc41ab17c042')

prepare() {
  cd $pkgname-$pkgver
  # Ghostscript removed finddevice operator without warning;
  # Until a new Lilypond release is cut to quickly fix the issue let's make Lilypond functional again.
  # https://gitlab.com/lilypond/lilypond/-/issues/6675
  # https://bugs.archlinux.org/task/80155
  patch -p1 < ../lilypond-gs.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --disable-texi2html
  make all bytecode
}

package() {
  depends+=(libfontconfig.so libfreetype.so libglib-2.0.so libgobject-2.0.so
  libguile-2.2.so libpangoft2-1.0.so libpango-1.0.so)

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" vimdir="/usr/share/vim/vimfiles" install install-bytecode
  install -vDm 644 LICENSE.OFL -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,NEWS}.txt README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
