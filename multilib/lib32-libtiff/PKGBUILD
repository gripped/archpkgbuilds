# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}
pkgver=4.6.0rc1
pkgrel=1
pkgdesc='Library for manipulation of TIFF images (32-bit)'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=(
  libtiff=$pkgver
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-libjpeg-turbo'
  'lib32-xz'
  'lib32-zlib'
  'lib32-zstd'
)
provides=('libtiff.so' 'libtiffxx.so')
source=("https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"{,.sig})
sha512sums=('96266319a1214acd82d22dac8a79c681ba8d2c8ee7dc1672fd2bfa693acc009f82abf1362b8f026267f46214529cec5ff5a038aa29130bdd7b6e065cb0f16938'
            'SKIP')
b2sums=('a87a67d460e1228f63314b668f849f93c572155d69675443283498d30064e02970098641331c282a940ae673dcfa22b49815bc09cb547b8cbffa920b58a1d786'
        'SKIP')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd tiff-${pkgver//rc*/}
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
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --enable-ld-version-script
    --mandir=/usr/share/man
    --with-docdir=/usr/share/doc/${pkgname}
    --libdir=/usr/lib32
    --includedir=/usr/include/libtiff32
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd tiff-${pkgver//rc*/}
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd tiff-${pkgver//rc*/}
  make check
}

package() {
  depends+=('libjpeg.so')
  cd tiff-${pkgver//rc*/}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
