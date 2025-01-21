# Maintainer: Sébastien "Seblu" Luttringer
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils
pkgver=9.6
pkgrel=2
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system'
arch=('x86_64')
license=(
  GPL-3.0-or-later
  GFDL-1.3-or-later
)
url='https://www.gnu.org/software/coreutils/'
depends=( 
  acl  
  attr
  glibc
  gmp
  libcap
  openssl
)
makedepends=(
  git
  gperf
  python
  wget
)
source=(
  git+https://git.savannah.gnu.org/git/coreutils.git?signed#tag=v${pkgver}
  915004f403cb25fadb207ddfdbe6a2f43bd44fac.patch::https://git.savannah.gnu.org/gitweb/"?p=coreutils.git;a=patch;h=915004f403cb25fadb207ddfdbe6a2f43bd44fac"
)
validpgpkeys=(
 6C37DC12121A5006BC1DB804DF6FD971306037D9 # Pádraig Brady
)
b2sums=('8d8ee559af5401564314c87e6b2affb670d6de59546b23dab3fa5235d6d3c71f841f91dcb6daf9bf38db25ebc3c21db4f9a536568744fabe3d02bcf9430c90ca'
        '27302e9b2ba68f0e8b06c24e985f03c6a40418a0b09ee053583683d1305a9b172556e06773dbf23e279773514fdafe311f8da91aba444135a3ed2a99b0aa0edc')

prepare() {
  cd "${pkgname}"
  ./bootstrap
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd "${pkgname}"
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-openssl \
    --enable-no-install-program=groups,hostname,kill,uptime
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

