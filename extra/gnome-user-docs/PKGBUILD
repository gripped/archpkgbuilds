# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-user-docs
pkgver=50.2
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
b2sums=('065c917773e5a4cf0dd0e6b5db40e21898bc82d3a6015ccb69234e5da9f75a478978cf269c5634715cfa805c8632a487378f70c5ab0f0daaf95d993c325d57a5')

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
