# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=prrte
pkgname=(prrte{,-docs})
pkgver=3.0.4
pkgrel=1
pkgdesc="PMIx Reference RunTime Environment"
arch=(x86_64)
url="https://github.com/openpmix/prrte"
license=(BSD-3-Clause)
makedepends=(
  glibc
  hwloc
  libevent
  openpmix
  perl
)
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('94b87c213d8789791217011ec27596ccf27f787aa49608793cefe8c907391b4d7fc5191acd11e9895524867bd456b0b6ae2627b811fe472cc5bcec2d003062b9')
b2sums=('54f81aada7f54b811aed5be5eae6154732a73557b232f2d9092b8bc4e4da9491c4e09bbd4ef624132070999a141c4a8d220d5035644e05e05be8a29769700b26')

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
  cd $pkgname-$pkgver
  ./autogen.pl
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc/$pkgname
  )

  # set environment variables for reproducible build
  # see https://docs.prrte.org/en/latest/release-notes.html
  export HOSTNAME=buildhost
  export USER=builduser

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check() {
  make -k check -C $pkgname-$pkgver
}

package_prrte() {
  depends=(
    glibc
    hwloc
    libevent
    openpmix libpmix.so
  )
  optdepends=(
    'prrte-docs: for documentation'
  )
  provides=(libprrte.so)
  backup=(
    etc/$pkgname/prte-default-hostfile
    etc/$pkgname/prte-mca-params.conf
    etc/$pkgname/prte.conf
  )

  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/{doc,prte/rst}
  )
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # avoid a conflict with putty which also provides pterm: https://gitlab.archlinux.org/archlinux/packaging/packages/prrte/-/issues/1
  mv "$pkgdir"/usr/bin/{,prrte-}pterm
  mv "$pkgdir"/usr/share/man/man1/{,prrte-}pterm.1
}

package_prrte-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
