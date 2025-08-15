# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# NOTE: requires rebuilt with each new gcc version

pkgname=lib32-libltdl
pkgver=2.5.4+r62+g6389dce8
_commit=6389dce814b2f233844510a12eb59b2733933a66
pkgrel=1
_gccver=15.2.1
pkgdesc='A generic library support script (32-bit)'
arch=(x86_64)
url='https://www.gnu.org/software/libtool'
license=('LGPL-2.0-or-later WITH Libtool-exception')
depends=(sh tar lib32-glibc libtool)
makedepends=("gcc>=$_gccver" git help2man)
checkdepends=()
provides=("lib32-libtool=$pkgver")
conflicts=(lib32-libtool)
replaces=(lib32-libtool)
source=(
  git+https://git.savannah.gnu.org/git/libtool.git#commit=$_commit
  git+https://git.savannah.gnu.org/git/gnulib.git
  gnulib-bootstrap::git+https://github.com/gnulib-modules/bootstrap.git
)
b2sums=('9691ab298b423133e877dcd59e32637ec06ca29ca5c3fe106d2b7ecfcfc69ca0de312b7b999a02e3594bbd353374004496f93844928e63a1abc0a2e1ec770863'
        'SKIP'
        'SKIP')

pkgver() {
  cd libtool
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libtool

  git submodule init
  git config --local submodule.gnulib.url "${srcdir}"/gnulib
  git config --local submodule.gl-mod/bootstrap.url "${srcdir}"/gnulib-bootstrap
  git -c protocol.file.allow=always submodule update

  ./bootstrap
}

build() {
  export CC="gcc -m32" CXX="g++ -m32"

  cd libtool
  ./configure --prefix=/usr lt_cv_sys_lib_dlsearch_path_spec="/usr/lib /usr/lib32" --libdir=/usr/lib32
  make
}

package() {
  cd libtool
  make DESTDIR="$pkgdir" install-libLTLIBRARIES
}
