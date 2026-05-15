# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Thomas Mader <thezema@gmail.com>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=astyle
pkgver=3.6.16
pkgrel=1
pkgdesc='A free, fast and small automatic formatter for C, C++, C#, and Java source code'
arch=(x86_64)
url='http://astyle.sourceforge.net/'
license=(LGPL-3.0-only)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  git
  jdk8-openjdk
)
optdepends=(java-environment-openjdk)
source=(
  "$pkgname::git+https://gitlab.com/saalen/astyle.git#tag=$pkgver"
  simplify-makefile.patch
)
sha512sums=('b8cd1dfebe5293e5a551a8637157ecc5d8ad716f553614c7b047b34e0e333de1a76de52e6c3156314a9af77f5616c436f9e65f161dbbff1add06c308e956e481'
            '4a533c6b073a55206ea2c8351d6631ba6e056d59823c8988eae63a47a762e920ad852442b57ed1860a648199c34fbc08c31bb553f0dc3f1ed145c2c702ad0290')
b2sums=('ba8a5d8c68b527dc434c36cd630ad0b9fc870fd435560b1c13d7ecc6b86c325422a89add38633f8585ca06c6a866082241d6e5bae0007227868630d42aa27cab'
        '155dca3520e1669713efbf42431e4ba2c9c05006dcd2a14f58252d9e6913aab799af7b64c9040201e99ff8d12f953918124c83845fcf64ec025fc131e7acdf1f')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/simplify-makefile.patch"
}

build() {
  cd "$pkgname/AStyle/build/gcc"

  JAVA_HOME=/usr/lib/jvm/java-8-openjdk make shared release java
}

package() {
  cd "$pkgname/AStyle/build/gcc"

  DESTDIR="$pkgdir" make install
}
