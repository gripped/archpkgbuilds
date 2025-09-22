# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-user-docs
pkgver=49.0
pkgrel=1
pkgdesc="User documentation for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-user-docs"
arch=(any)
license=(CC-BY-3.0)
depends=(yelp)
makedepends=(
  git
  yelp-tools
)
groups=(gnome)
source=("git+$url.git#tag=${pkgver/[a-z]/.&}")
b2sums=('4835202592892d3fde194a2c346c8c90663c9b1caf27c095de3acdb57e6fa1ffa34c8a5c8a980050ca25bcf88ce46a53fe34d4e40247de17848fe38b6e3af067')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
