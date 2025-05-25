# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-user-docs
pkgver=48.2
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
b2sums=('423e288edd9bbb3c048ba065233e2cd15a1db71dd368cdeb19add9132258eabd798c87c3b449beec387b064ecb234dbaca20f002084f9bc10eb860fef9e0df6d')

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
