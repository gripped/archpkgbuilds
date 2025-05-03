# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# NOTE: requires rebuilt with each new gcc version

pkgname=lib32-libltdl
pkgver=2.5.4+r23+g5b582aed
_commit=5b582aed255d0a998bc2b678597ce7b03aef6ffa
pkgrel=1
_gccver=15.1.1
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
  disable-lto-link-order2.patch
)
b2sums=('a1a3f6d95c5a26e6317439419042586ec41573e74a2728780a2e895932097d2e9b6fd2c4a9e88e9c0511c51288d3c6276da4dad837280c9794dd530f70a79759'
        'SKIP'
        'SKIP'
        '9d1e0460b9ef56ba33ac498814b409d1b1d7c3e8ed41a3aed2a86d86341ed7051ca88a5adfa92bd87da968460514230058c3d490b58537d95722e68d7d1687ff')

pkgver() {
  cd libtool
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libtool

  # test 67 is broken with lto
  # this patch removes the -flto flag for this very test
  # adapt when -ffat-lto-objects is enabled by Arch
  patch -Np1 -i "${srcdir}"/disable-lto-link-order2.patch

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
