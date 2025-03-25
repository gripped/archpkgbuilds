# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgbase=openpmix
pkgname=(
  openpmix
  openpmix-docs
)
# NOTE: keep in sync with openmpi major versions
pkgver=5.0.7
pkgrel=1
pkgdesc="Extended version of the PMI standard"
arch=(x86_64)
url="https://github.com/openpmix/openpmix"
license=(BSD-3-Clause)
makedepends=(
  glibc
  hwloc
  perl
  libevent
  libevent_{core,pthreads}-2.1.so
  python
  zlib
)
# openpmix does not support LTO https://github.com/openpmix/openpmix/pull/3383
options=(!lto)
source=($url/releases/download/v$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('a0f39724e3e70b35d03e57ac626206273f9a4fc5a7b6fc010e272b0ffe78c5c07119ba21f3a274e68cb9c2d87ce1abb81ce2f1aaadd71e399788f554bf485bd0')
b2sums=('9f0282aaba4448b5a82ea3574702d3ab92f7fc8d67a16d4f4e1afcea187dcc4f41bd98bbe4d59951fe8e20c0cc634c6664574e31f2d5538de8a2a2f43fd7f73a')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $_name-$pkgver
  ./autogen.pl
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc/$pkgname
  )

  # set environment variables for reproducible build
  # see https://docs.openpmix.org/en/latest/release-notes/general.html
  export HOSTNAME=buildhost
  export USER=builduser

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check() {
  make -k check -C $_name-$pkgver
}

package_openpmix() {
  depends=(
    glibc
    hwloc
    libevent libevent_{core,pthreads}-2.1.so
    zlib
  )
  optdepends=(
    'openpmix-docs: for documentation'
  )
  provides=(libpmix.so pmix)
  backup=(etc/$pkgname/pmix-mca-params.conf)

  make DESTDIR="$pkgdir" install -C $_name-$pkgver

  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc/
  )

  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_openpmix-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
