# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=less
pkgver=691
pkgrel=2
epoch=1
pkgdesc='A terminal based program for viewing text files'
license=('GPL-3.0-or-later OR LicenseRef-Less')
arch=('x86_64')
url='https://www.greenwoodsoftware.com/less/'
depends=(
  glibc
  ncurses 
  pcre2
)
makedepends=(
  git
)
validpgpkeys=('AE27252BD6846E7D6EAE1DD6F153A7C833235259') # Mark Nudelman
source=(
  https://www.greenwoodsoftware.com/$pkgname/$pkgname-$pkgver.tar.gz
  $pkgname-$pkgver.tar.gz.sig::https://www.greenwoodsoftware.com/$pkgname/$pkgname-$pkgver.sig
  less-Fix-handling-of-empty-terminfo-capabilities.patch::https://github.com/gwsw/less/commit/18db5ae3ae833af302ea0fbfd1e5c633ac73a743.patch
)
b2sums=('b74fe33259ac5731cc6230e115c8ab21f34c8a3e67efbb5ee554af6377a17f9ee3a92f99e9ee2f9c757804de5f0f061c87582d26da71a2c8a62fb079434abe62'
        'SKIP'
        '0bd88c7ded6bb0ec2e6c773ef9490bf8d8b9a4812ff88c0dbc5b534be03ddc56cf3a9e78220b6940a8ee90a467faf4b51ef8c0b4f58401a332e502eee404ad9c')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    # TODO: reactivate when dropping the git exclude patch patch -Np1 < "../$src"
    git apply --exclude NEWS --exclude version.c "../$src"
  done
}

build() {
  cd $pkgname-$pkgver
  sh configure --prefix=/usr --sysconfdir=/etc --with-regex=pcre2
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 {,"$pkgdir"/usr/share/licenses/$pkgname/}LICENSE
}

# vim:set ts=2 sw=2 et:
