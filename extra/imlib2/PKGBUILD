# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>

pkgname=imlib2
pkgver=1.13.0
pkgrel=2
pkgdesc='Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support'
url='https://sourceforge.net/projects/enlightenment/'
arch=('x86_64')
license=('BSD')
makedepends=(# Currently highway does provide a static library only, that libjxl links to.
             # This introduces a build dependency for now...
             'highway'
             'git' 'libheif' 'libid3tag' 'libjxl' 'librsvg' 'libspectre' 'libwebp' 'openjpeg2')
depends=('bzip2' 'freetype2' 'giflib' 'libjpeg-turbo' 'libpng' 'libtiff' 'libxext' 'xz')
optdepends=('libheif: HEIF loader (for AVIF)'
            'libid3tag: ID3 loader'
            'libjxl: JXL loader'
            'librsvg: SVG loader'
            'libspectre: PS loader'
            'libwebp: WEBP loader'
            'openjpeg2: J2K loader')
provides=('libImlib2.so')
source=("${pkgname}::git+https://git.enlightenment.org/old/legacy-imlib2.git#tag=v${pkgver}")
sha512sums=('848fd1743ade5d6e40432d3dc7d91a2fe4a2740f783632ad376dfb2de5be163d10e866ebeb373e842a665280caca0601ddc007d8ef8f4db71bdf8509151d2e8d')

prepare() {
  cd "${pkgname}"
  autoreconf -fiv
}

build() {
  cd "${pkgname}"

  local config_opts=(
    --prefix=/usr
    --sysconfdir=/etc/imlib2
    --x-libraries=/usr/lib
  )

  if [[ $CARCH == "x86_64" ]]; then
    config_opts+=(--enable-amd64)
  fi

  ./configure "${config_opts[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}


check() {
  cd "${pkgname}"
  make check
}


package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  # Install License
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
