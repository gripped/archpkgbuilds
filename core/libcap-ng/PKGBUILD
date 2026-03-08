# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgbase=libcap-ng
pkgname=(
  libcap-ng
  python-capng
)
pkgver=0.9.1
pkgrel=1
pkgdesc='A library for Linux that makes using posix capabilities easy'
arch=(x86_64)
url='https://people.redhat.com/sgrubb/libcap-ng/'
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(glibc)
makedepends=(
  python
  swig
)
source=(
  https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('69c18e2b85b0e41ff04cdd569d820609546ab7e974500187a7c849ea67aec6513fc352bad4335765be6bf02ea2fecb83e75aa9a0578b0aaa822911b164330a74')
b2sums=('9b81e9f4d0638547cccab573e8fad3dd6b0de6ffe30b7d2e49f7c551b822a133f95ec24a45af697cdcf2d7dd45e39c240671c111c9499a5343f8b06748f244f3')

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
  cd $pkgbase-$pkgver
  # make stupid autotools happy -_-
  touch NEWS
  autoreconf -fiv
}

build() {
  local configure_options=(
    --enable-static=no
    --prefix=/usr
    --with-python3
    --without-python
  )

  cd $pkgbase-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C $pkgbase-$pkgver
}

package_libcap-ng() {
  provides=(
    libcap-ng.so
    libdrop_ambient.so
  )

  make DESTDIR="$pkgdir" install -C $pkgbase-$pkgver

  (
    cd "$pkgdir"
    _pick python-capng usr/lib/python*
  )
}

package_python-capng() {
  pkgdesc+=' (Python bindings)'
  depends+=(
    libcap-ng libcap-ng.so
    python
  )
  provides=(
    python-libcap-ng
  )

  mv -v python-capng/* "$pkgdir"
}

# vim: ts=2 sw=2 et:
