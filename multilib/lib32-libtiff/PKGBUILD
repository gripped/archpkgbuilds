# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}
pkgver=4.6.0
pkgrel=2
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
source=("https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"{,.sig}
        # CVE-2023-6277
        "https://gitlab.com/libtiff/libtiff/-/commit/5320c9d89c054fa805d037d84c57da874470b01a.patch")
sha512sums=('80a117780fe5e2519b5c6661efa90a8a1e4591eb6300068b611ff9887285641c0782d9835482f589d6d109c3be6ffab8831c3561bb40e2456258deb1e896f08e'
            'SKIP'
            '67488a0c17d423a9c5a9609d4014f17c78bb82a4ad9ce3d55d39c09d0f886fa824a06f547d9fbf37533a2577477cab1403732357488140ce6c08827987b662dc')
b2sums=('aa3d51ffb7d800424a05e6a12e2eaad41adfe7d676650d2857bcc073a25627be88372410a27126e9c067692060c26bd2dec80a42a2188197f6f3ff9d8507fc8f'
        'SKIP'
        'f0ecae3d1b75133823aa9361caeb3123ddda72d21748552daf2bcf9c771ace743b888956d6320593e85f9b2f0fc558f21bceabf81312ed5f5845859e3f7c9199')
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
