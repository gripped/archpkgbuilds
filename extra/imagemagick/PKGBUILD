# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=imagemagick
pkgver=7.1.2.12
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=2
pkgdesc='An image viewing/manipulation program'
url='https://www.imagemagick.org/'
arch=(x86_64)
license=(custom)
depends=(bzip2
         cairo
         fftw
         fontconfig
         freetype2
         gcc-libs
         glib2
         glibc
         lcms2
         liblqr
         libltdl
         libpng
         libraqm
         libxext
         libxml2
         xz
         zlib)
optdepends=('ghostscript: PS/PDF support'
            'jbigkit: JBIG support'
            'libheif: HEIF support'
            'libjpeg-turbo: JPEG support'
            'libjxl: JPEG XL support'
            'libraw: DNG support'
            'librsvg: SVG support'
            'libtiff: TIFF support'
            'libultrahdr: UHDR support'
            'libwebp: WEBP support'
            'libwmf: WMF support'
            'libzip: OpenRaster support'
            'ocl-icd: OpenCL support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG2000 support'
            'djvulibre: DJVU support'
            'pango: Text rendering')
options+=(!emptydirs libtool)
backup=(etc/ImageMagick-7/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
provides=(libmagick)
makedepends=(chrpath
             djvulibre
             ghostscript
             git
             glu
             jbigkit
             libheif
             libjpeg-turbo
             libjxl
             libraw
             librsvg
             libultrahdr
             libwebp
             libwmf
             libzip
             ocl-icd
             opencl-headers
             openexr
             openjpeg2)
checkdepends=(gsfonts
              ttf-dejavu)
replaces=(imagemagick-doc)
source=(git+https://github.com/ImageMagick/ImageMagick#tag=$_pkgver
        libraw-0.22.patch)
sha256sums=('d4c712c757c037171bc75680c268dc2f3a1f56d2a7b6f88cb8295253cc4ca06c'
            'baed7cbfb378734d32d277b6e13882ac541932ef67e6aa8867b185ffef12f986')
validpgpkeys=(C305FEBD4C4081119CB3C12CE640E67B2C7F96AA)  # Dirk Lemstra <dirk@lemstra.org>

prepare() {
  patch -d ImageMagick -p1 < libraw-0.22.patch
}

build() {
  cd ImageMagick
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --disable-static \
    --with-dejavu-font-dir=/usr/share/fonts/TTF \
    --with-gs-font-dir=/usr/share/fonts/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --enable-hdri \
    --enable-opencl \
    --without-gslib \
    --with-djvu \
    --with-fftw \
    --with-jxl \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-perl \
    --with-perl-options='INSTALLDIRS=vendor INSTALL_BASE=' \
    --with-rsvg \
    --with-uhdr \
    --with-webp \
    --with-wmf \
    --with-xml \
    --without-autotrace \
    --without-dps \
    --without-fpx \
    --without-gcc-arch \
    --without-gvc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() (
  cd ImageMagick
  ulimit -n 4096
  make check
)

package() {
  cd ImageMagick
  make DESTDIR="$pkgdir" install

  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "$pkgdir"/etc/ImageMagick-*/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dm644 LICENSE NOTICE -t "$pkgdir"/usr/share/licenses/$pkgname
}
