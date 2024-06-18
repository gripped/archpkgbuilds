# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libndp
pkgver=1.8
pkgrel=2
pkgdesc="Library for Neighbor Discovery Protocol"
url="http://libndp.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(glibc)
makedepends=(git)
source=("git+https://github.com/jpirko/libndp#tag=v$pkgver")
b2sums=('e2b6d04137c769fa870fa85be159f3a9d3b7c3302d7999962279a643ecc85639e9513c6c8d6a531b23b4bfb929aa16382eab062ee4e5a3f46425ed3ea7747b2e')

prepare() {
  cd $pkgname

  # Fix CVE-2024-5564
  # https://github.com/jpirko/libndp/issues/26
  git cherry-pick -n 05e4ba7b0d126eea4c04387dcf40596059ee24af

  ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --disable-static
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
