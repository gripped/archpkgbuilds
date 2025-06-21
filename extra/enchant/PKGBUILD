# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=enchant
pkgver=2.8.9
pkgrel=1
pkgdesc="A wrapper library for generic spell checking"
url="https://rrthomas.github.io/enchant/"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
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
b2sums=('92cfa405253f88bce7651015369aa44582e7ed47133e53c0be7ad5a7998d7a2192cd06b2dc9035f868edc8757136db8c60124d02ed0173403e442ae2fb9db72b'
        'SKIP'
        'SKIP')

prepare() {
  cd enchant

  git submodule init
  git submodule set-url gnulib "$srcdir/gnulib"
  git submodule set-url gl-mod/bootstrap "$srcdir/bootstrap"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

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
