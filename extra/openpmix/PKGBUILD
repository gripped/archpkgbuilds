# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgbase=openpmix
pkgname=(
  openpmix
  openpmix-docs
)
# NOTE: keep in sync with openmpi major versions
pkgver=5.0.4
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
sha512sums=('8d723767131629d8c0c5d86832519b67a88fbdca865f3b57768f6d5aa75cec72223c69c2bef5316fe32dbb7a98f7556e0bc1c857c0e24a4d81551f02745e0715')
b2sums=('29c81cafdab7a7077e5bd9e20f419be074b45399b3d5eaff0eb40ae8f07043b8ce9f1ee90d1d49bd2c7b3f222af4e57fd9c38c157b45b1ae4bb90649b22dc708')

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
