# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxslt
pkgname=(
  libxslt
  libxslt-docs
)
pkgver=1.1.40
pkgrel=1
pkgdesc="XML stylesheet transformation library"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
  libgcrypt
  libxml2
  xz
)
makedepends=(
  git
  python
)
checkdepends=(
  docbook-xml
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxslt.git#tag=v$pkgver"
)
b2sums=('12737793c1b71c2336f4010dcd2b7c340c1b392962bc1cbf0211dd6bd19559d33db0a654177bad96530628fff286bb08c2fbb4ce8056543f008e118419b8b4ab')

prepare() {
  cd libxslt
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --with-python=/usr/bin/python
  )

  cd libxslt
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  make check
}

package_libxslt() {
  optdepends=('python: Python bindings')
  provides=(lib{,e}xslt.so)

  cd libxslt
  make DESTDIR="$pkgdir" install

  mkdir -p ../doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t ../doc/usr/share

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxslt-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxslt/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
