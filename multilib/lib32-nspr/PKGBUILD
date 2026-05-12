# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgname=lib32-nspr
pkgver=4.39
pkgrel=1
pkgdesc="Netscape Portable Runtime (32-bit)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  lib32-glibc
  nspr
)
makedepends=(
  mercurial
  zip
)
source=(
  "hg+https://hg.mozilla.org/projects/nspr#tag=NSPR_${pkgver//./_}_RTM"
  0001-linux-prefer-GCC-provided-atomics-to-asssembly-imple.patch
  0002-configure.in-Remove-assembly-files-from-build.patch
)
b2sums=('00212fcb4c1da5e1c3e42ccc86a6268b979f4817f632416ee2dba5e392378fb7cf3b1a748ed5d3c4f359c80f1bcac474ca8ce79e244ccc99b2889e7a36d8aaf5'
        'db892799f30dfd664151e476da8444db52ca3df375a8a2d9196666e52c2d1620420653e3c2d0d1a8f64ac2f9ce32f5ae1f79a5eeca0e95c2cfc6f158fc69797b'
        'f16252f40792059fd7be140fd06a84d8ecff764ab3c301b0ba56d01b7bc7e51d9cc5ea9760226c2292253288cf600fd388c62be34a85f9c648953821b491f3fd')

prepare() {
  cd nspr

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1496426
  # https://gitlab.archlinux.org/archlinux/packaging/packages/nspr/-/merge_requests/1
  patch -Np1 -i ../0001-linux-prefer-GCC-provided-atomics-to-asssembly-imple.patch
  patch -Np1 -i ../0002-configure.in-Remove-assembly-files-from-build.patch

  autoreconf -fvi
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --includedir=/usr/include/nspr
    --enable-optimize
    --disable-debug
    --disable-64bit
  )

  cd nspr
  ./configure "${configure_options[@]}"
  make ${SOURCE_DATE_EPOCH:+
    SH_NOW="${SOURCE_DATE_EPOCH}000000"
    SH_DATE="$(date --utc --date="@$SOURCE_DATE_EPOCH" '+%Y-%m-%d %T')"
  }
}

package() {
  cd nspr
  make DESTDIR="$pkgdir" install
  ln -s nspr.pc "$pkgdir/usr/lib32/pkgconfig/mozilla-nspr.pc"

  rm -r "$pkgdir"/usr/{bin,share,include}
}

# vim:set sw=2 sts=-1 et:
