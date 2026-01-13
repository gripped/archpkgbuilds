# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Bruno Pagani <archange@archlinux.org
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

pkgname=qgis
pkgver=3.44.6
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats'
arch=(x86_64)
url='https://qgis.org/'
license=(GPL-2.0-or-later)
depends=(
  abseil-cpp
  draco
  exiv2
  expat
  gcc-libs
  gdal
  geos
  glibc
  gsl
  hdf5
  hicolor-icon-theme
# libspatialindex
  libspatialite
  libxml2
  libzip
  netcdf
  ocl-icd
  pdal
  postgresql-libs
  proj
  protobuf
  python
  python-gdal
  python-jinja
  python-numpy
  python-owslib
  python-packaging
  python-psycopg2
  python-pyqt5
  python-qscintilla-qt5
  python-yaml
  qca-qt5
  qscintilla-qt5
  qt5-3d
  qt5-base
  qt5-declarative
  qt5-imageformats
  qt5-location
  qt5-multimedia
  qt5-serialport
  qt5-svg
  qtkeychain-qt5
  qwt
  sqlite
  zlib
  zstd
)
makedepends=(
  cmake
  fcgi
  ninja
  opencl-clhpp
  pyqt-builder
  qt5-tools
  sip
)
optdepends=(
  'fcgi: Map server'
  'gpsbabel: GPS Tools plugin'
)
source=("https://qgis.org/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('6a7a0ad471b325f0ac364a7256b415013fc23e3ede3e6b152005739a8d273cd3')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_3D=TRUE \
    -DWITH_QUICK=TRUE \
    -DQGIS_QML_SUBDIR=lib/qt/qml \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QTWEBKIT=FALSE \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_PDAL=TRUE \
    -DHAS_KDE_QT5_PDF_TRANSFORM_FIX=TRUE \
    -DHAS_KDE_QT5_SMALL_CAPS_FIX=TRUE \
    -DHAS_KDE_QT5_FONT_STRETCH_FIX=TRUE \
    -DWITH_INTERNAL_SPATIALINDEX=TRUE # https://github.com/libspatialindex/libspatialindex/issues/276
    # https://github.com/qgis/QGIS/issues/48374
    #-DWITH_INTERNAL_LAZPERF=FALSE \
    # https://github.com/qgis/QGIS/issues/35440
    #-DWITH_PY_COMPILE=TRUE \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
