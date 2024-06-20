# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxslt
pkgname=(
  libxslt
  libxslt-docs
)
pkgver=1.1.41
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
  0001-runtest-Print-output-causing-failure.patch
)
b2sums=('6acf532a59cb6d2bfa1fee8c409f21f3b68caa2bc0362906e83e0fc133d4c946ee26eded171aad6a50f0c6efe7c8bf13ffbd16c6f3e3937c0cca47509bef1305'
        'b63a1f2bf704d4561cc30734cee980534fb0586234b7b593d57d9c70fe59abd72610b6d825ab136d4d1dd7540bbfb6b8a6edc95618c15cc79e5a4bbd8f6341ee')

prepare() {
  cd libxslt

  # Make test failures easier to fix
  git apply -3 ../0001-runtest-Print-output-causing-failure.patch

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
