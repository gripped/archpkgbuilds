# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgbase=nvidia-settings
pkgname=('nvidia-settings' 'libxnvctrl')
pkgver=570.153.02
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxext' 'vulkan-headers')
options=('staticlibs')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('039da4b5d2adf4100be47ed20243b36c9ee14889aa5d19b5a0d2ecae520cfbefcb67bc0af5bc8b9bc89016b4b9a7bfcfe334dd87732b1ffedf688459527ea6aa'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out

  cd ${pkgbase}-${pkgver}
  patch -Np1 -i "${srcdir}"/nvidia-settings-libxnvctrl_so.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  export CFLAGS+=" -ffat-lto-objects"
  make
}

package_nvidia-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxnvctrl')

  cd ${pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" make install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed \
    -e 's:__UTILS_PATH__:/usr/bin:' \
    -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
    -e 's/__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__/Settings;HardwareSettings;/' \
    -e 's/Icon=.*/Icon=nvidia-settings/' \
    -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
}

package_libxnvctrl() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension'
  provides=('libXNVCtrl.so')

  cd ${pkgbase}-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -Dm 644 src/libXNVCtrl/*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr src/out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
