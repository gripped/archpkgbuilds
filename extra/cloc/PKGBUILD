# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Diogo Ferreira <diogo@underdev.org>

pkgname=cloc
pkgver=2.06
pkgrel=1
pkgdesc="Count lines of code"
arch=('any')
url="https://github.com/AlDanial/cloc"
license=('GPL-2.0-or-later')
depends=('perl' 'perl-algorithm-diff' 'perl-regexp-common'
         'perl-parallel-forkmanager')
source=(https://github.com/AlDanial/cloc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('27b6b007a5d482e5f50b23984cbe10f6a9f26e1052e9c7e010edfdcf879dc554')

package() {
  cd $pkgname-$pkgver/Unix
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
