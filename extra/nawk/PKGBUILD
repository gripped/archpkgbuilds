# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

# Upstream has a history of forgetting to tag releases even when they bump the
# version and comment that it is a release. See e.g.:
# https://github.com/onetrueawk/awk/issues/141
# https://github.com/onetrueawk/awk/issues/222
#
# If this happens again, releases can be bumped from commits that appear in the
# master branch at points where internal version number is updated. Uncomment
# this for it to take effect:
_commit=d7f37646965ee26214da0e1d97f3c1d54349ae2d

pkgname=nawk
pkgver=20250804
pkgrel=1
pkgdesc='The one, true implementation of AWK'
url="https://github.com/onetrueawk/awk"
license=(MIT)
arch=(x86_64)
options=(!makeflags)
depends=(glibc)
makedepends=(git)
source=("git+$url.git#commit=${_commit:-$pkgver}"
        'manpage-naming.patch')
sha256sums=('74f1a765cca18372168d7c2102b1909b8a97355b3a0a4c36f81ba6138747e938'
            'fa1bade363896033a50fbdadc8fa2f490f85a044d11afcd537f317067c70d3b5')

# This pkgver function is not necessary for tagged releases but if _commit is
# used to package something that did not get tagged this helps make sure the
# package version matches the internal version string.
pkgver() {
  grep "version " awk/main.c |
    sed -e 's/[^"]*"\([^"]*\)".*/\1/' -e 's/^\w*\ *//'
}

prepare() {
  cd awk
  patch -Np1 < "../${source[1]}"
}

check() {
  cd awk
  ./REGRESS
}

build() {
  cd awk
  # the final linking step doesn't honor LDFLAGS, so let's just throw it all
  # together into CFLAGS.
  make \
    "CPPFLAGS=-DHAS_ISBLANK $CPPFLAGS" \
    "CFLAGS=$CFLAGS $LDFLAGS"
}

package() {
  cd awk
  install -Dm0755 a.out "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 awk.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
