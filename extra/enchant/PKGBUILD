# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=enchant
pkgver=2.8.16
pkgrel=1
pkgdesc="A wrapper library for generic spell checking"
url="https://rrthomas.github.io/enchant/"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'aspell'
  'git'
  'hspell'
  'hunspell'
  'libvoikko'
  'nuspell'
  'vala'
)
checkdepends=('unittestpp')
optdepends=(
  'aspell: for aspell based spell checking support'
  'hspell: for hspell based spell checking support'
  'hunspell: for hunspell based spell checking support'
  'libvoikko: for libvoikko based spell checking support'
  'nuspell: for nuspell based spell checking support'
)
provides=('libenchant-2.so')
source=(
  "git+https://github.com/rrthomas/enchant#tag=v$pkgver"
  "git+https://git.savannah.gnu.org/git/gnulib.git"
  "git+https://github.com/gnulib-modules/bootstrap.git"
)
b2sums=('32001293b5112fcd3810740e3c438b73d5d4c72f7dbaf5340200e5892f7ba91bee5d359b6d8fbfd6d2e271af10e8e30e1d3e700729486fba57ac4ee9975cd911'
        'SKIP'
        'SKIP')

prepare() {
  cd enchant

  git submodule init
  git submodule set-url gnulib "$srcdir/gnulib"
  git submodule set-url gl-mod/bootstrap "$srcdir/bootstrap"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

  # Fix invalid-argument handling with Vala 0.56.19:
  # https://github.com/rrthomas/enchant/commit/9793d2ab80b4d213212fae3900ceca3719a9f1f0
  git cherry-pick -n 9793d2ab80b4d213212fae3900ceca3719a9f1f0
  # Remove the null-dictionary test made invalid by the same Vala fix:
  # https://github.com/rrthomas/enchant/commit/45b801ccecff1aaee91df2762a7f7b1fa1a649e3
  git cherry-pick -n 45b801ccecff1aaee91df2762a7f7b1fa1a649e3

  ./bootstrap
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --enable-relocatable
  )

  cd enchant
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd enchant
  make check
}

package() {
  cd enchant
  make DESTDIR="$pkgdir" install
}
