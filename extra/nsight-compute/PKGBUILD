# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-compute
pkgver=2025.3.1.4
pkgrel=2
pkgdesc="Interactive profiler for NVIDIA CUDA and OptiX"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-compute"
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus
  expat
  fontconfig
  glib2
  glibc
  libdrm
  libglvnd
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxrender
  libxshmfence
  libxtst
  nspr
  nss
  wayland
  xcb-util-cursor
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  # there are bundled libs: boost, gcc-libs, icu, libssh, libz, openssl, qt6, zstd
)
optdepends=(
  'cuda: for profiling on the local system'
)
options=(!debug !strip)
source=(
  https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz
  nsight-compute.desktop
)
b2sums=('48788f91dc65cc1548d21eb22d8739c222a45a20c57265b0ad04991d73fb6bbcd44110f4255b324531dc744de54ad6671713db5fadfa44c96b2f9d9832963308'
        '3dc305bcdbf6927a3645ce4c2bb4e251d45f3fe026710f54c8cc5949c8037780df0b75b5f76e4052cdb5992bc5f88d6ef582966d7b9f78e0a594b4dfc87e7e67')

package() {
  cd ${pkgname/-/_}-linux-x86_64-${pkgver}-archive

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/
  cp -arv extras host ncu ncu-ui sections target "$pkgdir"/usr/lib/$pkgname/

  # create symlinks in /usr/bin/
  install -vdm 755 "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin/ ../lib/$pkgname/{ncu,ncu-ui}

  # install documentation
  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -arv docs/* "$pkgdir"/usr/share/doc/$pkgname/

  # install license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # install desktop entry
  install -vDm 644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop
}
