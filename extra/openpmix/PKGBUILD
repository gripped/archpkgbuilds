# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgbase=openpmix
pkgname=(
  openpmix
  openpmix-docs
)
# NOTE: keep in sync with openmpi major versions
pkgver=5.0.9
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
sha512sums=('84433923346d3dd6b89064e10742f71cee2ab17864b4c694ea1d7e8733c166108eb7873a6445002e5d5ab07c341b38020dc8f16ea6ac9cdf124f3729a7577306')
b2sums=('cad8d8d680ee32b2713f756b486c4995b8c06e4ee63112ebbf7f4f9a26fe868328090210c69123b1520b02ad150dca145ee9d68dd23028195e2d56ead1d7d34b')

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
