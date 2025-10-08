# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: FigoDaPaura <ffigoDaPaura>
# Contributor: Andres Jimenez

pkgname=virtualgl
pkgver=3.1.4
pkgrel=1
pkgdesc="Redirects 3D commands from an OpenGL application onto a server-side 3D graphics card"
arch=('x86_64')
url="https://virtualgl.org"
license=('LGPL')
depends=('libxv' 'glu' 'libjpeg-turbo' 'xcb-util-keysyms' 'opencl-driver' 'ocl-icd' 'xorg-xhost' 'inetutils')
makedepends=('cmake' 'mesa' 'libxtst' 'opencl-headers' 'ninja')
source=("https://github.com/VirtualGL/virtualgl/releases/download/${pkgver}/VirtualGL-${pkgver}.tar.gz"{,.sig}
        "$pkgname.sysusers")
sha512sums=('266af1ddb923e07f52bba166cd6dd6066b371928946a0cd7cf5d200dde2b4bad6d3c7f1477dd6c575f830b42705468d444e413eedb4305ec34dfefab138d949f'
            'SKIP'
            'fa97a6c40a216db1632563187bbc5452025cfb8f93341b84e8d71894113f4236f4c64cb38bdd0c4ac55eececec2aad6f357b8716af08b181d3f1352da34fe799')
validpgpkeys=('AE1A7BA4EFFF9A9987E1474C4BACCAB36E7FE9A1') # The VirtualGL Project (Signing key for official binaries) <information@VirtualGL.org>

prepare() {
  cd "VirtualGL-$pkgver"

  # FS#48403
  export LDFLAGS="${LDFLAGS/--as-needed,}"
}

build() {
  cd "VirtualGL-$pkgver"

  cmake \
      -GNinja \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DTJPEG_INCLUDE_DIR=/usr/include \
      -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib/virtualgl \
      -DCMAKE_INSTALL_BINDIR=/usr/bin \
      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/${pkgname} \
      -DVGL_FAKEXCB=1
  ninja -C build
}

package() {
  cd "VirtualGL-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install

  mv "$pkgdir"/usr/bin/glxinfo "$pkgdir"/usr/bin/vglxinfo
  mv "$pkgdir"/usr/bin/eglinfo "$pkgdir"/usr/bin/veglinfo
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
