# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-user-docs
pkgver=46.0
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
_commit=a82f6962b09daef551da1c33585819c19d1ff72c  # tags/46.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-user-docs.git#commit=$_commit")
b2sums=('094bd68e3a6d1f89cb512582f1072291c72bf1342a5b3b606820df1ef4fa96f3416149f8b77f009abd608b82bfcc89c8132f0b1277d10a46bd73baf6ba8e90f4')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

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
