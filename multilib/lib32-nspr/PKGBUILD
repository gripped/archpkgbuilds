# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgname=lib32-nspr
pkgver=4.38
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
b2sums=('b164090e2ae001d4fd0c68d3c181543e2c77e97ae8c2842c3903615450f3fa4e5e3dbae9130c4035465ffb85453476401a833cdc80a93eed54531c171a345260'
        '50a9d787e3a5c569472a47efbde1a0ceb3f1be97b2b2f29148f010c3eca9c1f94e7045c58d49213b61e3677550bc0af01245a8daf9ca4580b94f29658e0b8e75'
        'bacfa4b91d40d34290ad1e7404007bd1ab9ac4b06ca173b4c66e34d6ea96b7bb4b2421f3a78e39417cc2c41aad3979f0e4e07df4c20b73f7f373763ef6e9c739')

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
