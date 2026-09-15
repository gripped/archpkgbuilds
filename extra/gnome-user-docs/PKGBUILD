# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-user-docs
pkgver=50.5
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
b2sums=('c501680d1439801574d0c4797ec826459755433ec0b6bbf15ee9892a21c847a03143d9adfc99a1316a6df49ae4ea2760ebe5a01070f41d7cdaba052eab33591d')

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
