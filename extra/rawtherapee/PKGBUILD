# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
# Contributor: Bogdan Szczurek <thebodzio(at)gmail.com>
# Contributor: Vaclav Kramar <vaclav.kramar@tiscali.cz>
# Contributor: Archie <mymaud@gmail.com>

pkgname=rawtherapee
epoch=1
pkgver=5.12
pkgrel=3
pkgdesc='A powerful cross-platform raw image processing program'
arch=('x86_64')
url='https://www.rawtherapee.com/'
license=('GPL-3.0-or-later')
depends=('atkmm' 'libatkmm-1.6.so'
         'cairo' 'libcairo.so'
         'cairomm' 'libcairomm-1.0.so'
         'desktop-file-utils'
         'exiv2' 'libexiv2.so'
         'expat' 'libexpat.so'
         'fftw' 'libfftw3f.so' 'libfftw3f_omp.so'
         'glib2' 'libglib-2.0.so' 'libgobject-2.0.so'
         'glibc'
         'glibmm' 'libgiomm-2.4.so' 'libglibmm-2.4.so'
         'gtk3' 'libgdk-3.so' 'libgtk-3.so'
         'gtkmm3' 'libgdkmm-3.0.so' 'libgtkmm-3.0.so'
         'hicolor-icon-theme'
         'lcms2' 'liblcms2.so'
         'lensfun' #'liblensfun.so'
         'libcanberra' 'libcanberra-gtk3.so' 'libcanberra.so'
         'libgcc' 'libgcc_s.so'
         'libgomp' 'libgomp.so'
         'libiptcdata'
         'libjpeg-turbo' 'libjpeg.so'
         'libjxl' 'libjxl.so' 'libjxl_threads.so'
         'libpng' 'libpng16.so'
         'librsvg' 'librsvg-2.so'
         'libsigc++' 'libsigc-2.0.so'
         'libstdc++' 'libstdc++.so'
         'libtiff' 'libtiff.so'
         'pangomm' 'libpangomm-1.4.so'
         'zlib' 'libz.so')
makedepends=('cmake' 'git')
source=("git+https://github.com/Beep6581/RawTherapee.git#tag=${pkgver}"
        '0001-Fix-static-init-order-fiasco-crashes.patch'
        '0001-Fix-typos.patch')
sha256sums=('4b8ee717fe3ccc29c59a95b1e690617203b2696de517332e0ccc2c43e0c3a604'
            '6bc05f0677890d1a673ce730cd2251aaade47252898722ed573b27dacee66d44'
            '8d1f933db531025ee91a5ebdc17cdb69829d70e9a1e53f65c91d7e28f6e7b3bc')

prepare() {
  cd RawTherapee

  # https://gitlab.archlinux.org/archlinux/packaging/packages/rawtherapee/-/work_items/5
  # https://src.fedoraproject.org/rpms/rawtherapee/tree/rawhide
  patch -Np1 < ../0001-Fix-static-init-order-fiasco-crashes.patch
  patch -Np1 < ../0001-Fix-typos.patch
}

build() {
  cmake -B build -S RawTherapee \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCACHE_NAME_SUFFIX="" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
