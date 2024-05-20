# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# NOTE: requires rebuilt with each new gcc version

pkgname=lib32-libltdl
pkgver=2.5.0+1+g38c166c8
_commit=38c166c89b02a8bc95cc51fca89d15949c4d8956
pkgrel=1
_gccver=14.1.1
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
b2sums=('0f6a653d74479c538128ea4a76b607a76e6812297c71888356770b90846c351ed7019f86b89e8e66ec28fbcf4a085e7345929de22eacc1ce54968fc999296f73'
        'SKIP'
        'SKIP')

pkgver() {
  cd libtool
  git describe --tags | sed 's/-/+/g;s/^v//'
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
