# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Diogo Ferreira <diogo@underdev.org>

pkgname=cloc
pkgver=2.08
pkgrel=1
pkgdesc="Count lines of code"
arch=('any')
url="https://github.com/AlDanial/cloc"
license=('GPL-2.0-or-later')
depends=(
  'perl'
  'perl-algorithm-diff'
  'perl-regexp-common'
  'perl-parallel-forkmanager'
)
makedepends=('git')
checkdepends=('unzip')
source=("git+$url.git#tag=v$pkgver")
b2sums=('9921837e28fbb85aa2a0e5e5e1135d6264762543d6aa258de8e3992eaf4034ec8d1016333d498ec795ac56c0bd49bf17fa52f762b80b2103722f5bdda8c9aa9c')

check() {
  cd $pkgname/Unix
  make test-perl test-pod
  ./t/00_C.t
  # ./t/02_git.t # Clones git repo / requires network access
  ./t/01_opts.t
}

package() {
  cd $pkgname/Unix
  make DESTDIR="$pkgdir" install
}
