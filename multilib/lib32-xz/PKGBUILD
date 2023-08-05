# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.4.4
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('lib32-glibc' 'xz')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620'  # Lasse Collin <lasse.collin@tukaani.org>
              '22D465F2B4C173803B20C6DE59FCF207FEA7F445') # Jia Tan <jiat0218@gmail.com>
source=("https://tukaani.org/xz/xz-${pkgver}.tar.gz"{,.sig})
sha256sums=('aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8'
            'SKIP')
sha512sums=('2e27d864c9f346e53afc549d7046385b5d35a749af15d84f69de14612657df2f0e2ce71d3be03d57adadf8fd28549ecf4ef1c214bdcd1f061b5a47239e0104e8'
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
