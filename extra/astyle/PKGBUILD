# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Thomas Mader <thezema@gmail.com>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=astyle
pkgver=3.6.15
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
sha512sums=('1e462e1ecbe73f652ca6e6d87138ac42e1f2f659273ef296af1fb3be3b2befeedca467ce26e8d977e8229e1570540011d99c573f50f2c69a6d4ed665a0c4fd23'
            '4a533c6b073a55206ea2c8351d6631ba6e056d59823c8988eae63a47a762e920ad852442b57ed1860a648199c34fbc08c31bb553f0dc3f1ed145c2c702ad0290')
b2sums=('4d49879a99140766ffb2ff9c2da46afa3a9601270bd1acb59beccfe99755c22dff980697e1da0eaf1ba43a7c066886de7ac303235e56485ab8f35c64ed5295b0'
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
