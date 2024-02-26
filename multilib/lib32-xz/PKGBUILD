# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.6.0
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://xz.tukaani.org/xz-utils/'
license=('GPL' 'LGPL' 'custom')
depends=('lib32-glibc' 'xz')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620'  # Lasse Collin <lasse.collin@tukaani.org>
              '22D465F2B4C173803B20C6DE59FCF207FEA7F445') # Jia Tan <jiat0218@gmail.com>
source=("https://github.com/tukaani-project/xz/releases/download/v${pkgver}/xz-${pkgver}.tar.gz"{,.sig})
sha256sums=('0f5c81f14171b74fcc9777d302304d964e63ffc2d7b634ef023a7249d9b5d875'
            'SKIP')
sha512sums=('1ef3cd3607818314e55b28c20263a9088d4b6e5362a45fbd37c17e799e26b4a7579928b99925ffe71e7804b0db2f65936f66a825bac9b23b7b0664f902925de8'
            'SKIP')

build() {
  cd "${srcdir}/xz-${pkgver}"

  export CC='gcc -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-rpath \
    --enable-werror
  make
}

check() {
  cd "${srcdir}/xz-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/xz-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -d -m0755 "${pkgdir}"/usr/share/licenses
  ln -s xz "${pkgdir}"/usr/share/licenses/lib32-xz
}
