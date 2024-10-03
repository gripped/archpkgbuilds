# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgbase=nvidia-open
pkgname=(nvidia-open nvidia-open-dkms)
pkgver=560.35.03
pkgrel=11
pkgdesc="NVIDIA open kernel modules"
arch=('x86_64')
url="https://github.com/NVIDIA/open-gpu-kernel-modules"
depends=("nvidia-utils=${pkgver}" 'libglvnd')
makedepends=('linux-headers')
license=('MIT AND GPL-2.0-only')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/open-gpu-kernel-modules/archive/refs/tags/${pkgver}.tar.gz"
        nvidia-open-gcc-ibt-sls.patch
        make-modeset-fbdev-default.patch
        6.11-fbdev.patch
        silence-event-assert-until-570.patch)
sha512sums=('a0cbe05fc8acbb4769fa5320d6bfe2033fd31775036e984278cdf7e67ebd801bd8991d4d1626884a4ff729d3900c969f385caea7ae049e3d918a1ea60e45890a'
            '263c4c5e75ef8cb8ca2641c022dfaf8bd9222fadf68ed15120b0ae7dd9cc901a04ce2e55625d513a0995759c9d82dfbdc4c33d4751159124915d7404b1400e34'
            'f19a7d52c6e7f5bd6818658c2b11adaaf4ad05016ec0acc73a42417748ed4bf81b8394c077a6f5aba9dfcf6ab01a578692ed1e9d3c2ab583fdaa56166bba05f2'
            '3b6357627ad4672d864b985088908d43f7718dc428e8901c9d27101fd2e9bc109c84e2b414688bbcaa9a05c1e7e55434fff06bf1df5ed33175f1e8bac95dc557'
            '8f0d0a4881588e10681060d6006a6c65108a753c3106a1a710cf90f8dba8e52e6d6c10633f8ad19b763a2ab119ef98fddc6db4481262daf644c0206ac2ecd2d9')

prepare() {
  cd open-gpu-kernel-modules-${pkgver}

  # Fix for https://bugs.archlinux.org/task/74886
  patch -Np1 --no-backup-if-mismatch -i "$srcdir"/nvidia-open-gcc-ibt-sls.patch

  # Enable modeset and fbdev as default
  # This avoids various issue, when Simplefb is used
  # https://gitlab.archlinux.org/archlinux/packaging/packages/nvidia-utils/-/issues/14
  # https://github.com/rpmfusion/nvidia-kmod/blob/master/make_modeset_default.patch
  patch -Np1 < "$srcdir"/make-modeset-fbdev-default.patch

  # Fix for https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/80
  patch -Np1 --no-backup-if-mismatch -i "$srcdir"/6.11-fbdev.patch

  # Patch by Nvidia to silence error messages until a real fix drops in 570.xx
	# https://github.com/NVIDIA/open-gpu-kernel-modules/issues/716#issuecomment-2391898884
  patch -Np1 --no-backup-if-mismatch -i "$srcdir"/silence-event-assert-until-570.patch

  # Attempt to make this reproducible
  sed -i "s/^HOSTNAME.*/HOSTNAME = echo archlinux"/ utils.mk
  sed -i "s/^WHOAMI.*/WHOAMI = echo archlinux-builder"/ utils.mk
  sed -i "s/^DATE.*/DATE = date -r version.mk"/ utils.mk

  sed -i "s/__VERSION_STRING/${pkgver}/" kernel-open/dkms.conf
  sed -i 's/__JOBS/`nproc`/' kernel-open/dkms.conf
  sed -i 's/__EXCLUDE_MODULES//' kernel-open/dkms.conf
  sed -i 's/__DKMS_MODULES//' kernel-open/dkms.conf
  sed -i '$i\
BUILT_MODULE_NAME[0]="nvidia"\
BUILT_MODULE_LOCATION[0]="kernel-open"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
BUILT_MODULE_LOCATION[1]="kernel-open"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
BUILT_MODULE_LOCATION[2]="kernel-open"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
BUILT_MODULE_LOCATION[3]="kernel-open"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-peermem"\
BUILT_MODULE_LOCATION[4]="kernel-open"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' kernel-open/dkms.conf

  # Clean version for later copying for DKMS
  cp -r ../open-gpu-kernel-modules-${pkgver} "$srcdir"/open-gpu-kernel-modules-dkms
}

build() {
  cd open-gpu-kernel-modules-${pkgver}
  CFLAGS= CXXFLAGS= LDFLAGS= make SYSSRC="/usr/src/linux"
}

package_nvidia-open() {
  depends+=('linux')
  conflicts=('NVIDIA-MODULE')
  provides=('NVIDIA-MODULE')

  cd open-gpu-kernel-modules-${pkgver}
  _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 kernel-open/*.ko
  find "${pkgdir}" -name '*.ko' -exec strip --strip-debug {} +
  find "${pkgdir}" -name '*.ko' -exec zstd --rm -19 {} +

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname
}

package_nvidia-open-dkms() {
  depends+=('dkms')
  conflicts=('nvidia-open' 'NVIDIA-MODULE')
  provides=('nvidia-open' 'NVIDIA-MODULE')

  install -dm 755 "${pkgdir}"/usr/src
  # cp -dr --no-preserve='ownership' kernel-open "${pkgdir}/usr/src/nvidia-$pkgver"
  cp -dr --no-preserve='ownership' open-gpu-kernel-modules-dkms "${pkgdir}/usr/src/nvidia-$pkgver"
  mv "${pkgdir}/usr/src/nvidia-$pkgver/kernel-open/dkms.conf" "${pkgdir}/usr/src/nvidia-$pkgver/dkms.conf"

  install -Dm644 open-gpu-kernel-modules-${pkgver}/COPYING "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set sw=2 et:
