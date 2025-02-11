# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Diogo Ferreira <diogo@underdev.org>

pkgname=cloc
pkgver=2.04
pkgrel=1
pkgdesc="Count lines of code"
arch=('any')
url="https://github.com/AlDanial/cloc"
license=('GPL-2.0-or-later')
depends=('perl' 'perl-algorithm-diff' 'perl-regexp-common'
         'perl-parallel-forkmanager')
source=(https://github.com/AlDanial/cloc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6113bce8314ba70ad3c790de402235e0cd3f7d55222e2008a760bfef770efc7a')

package() {
  cd $pkgname-$pkgver/Unix
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
