# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-systems
pkgver=2025.3.2.474
pkgrel=1
pkgdesc="System-wide statistical sampling profiler with tracing features"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-systems"
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
  'cuda: for GPU profiling on the local system'
)
options=(!debug !strip)
source=(
  https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz
  nsight-systems.desktop
)
b2sums=('2e43f866a6ea76b1956e89449e4ec6f99c8e0ea63211c64980f5cc627b1339e9791bd5500ab70061990190f716ed315f7f9018d2199fa9632ba845a1d59f3c36'
        'd77257e4507ec44c729a314d6c264e1aa7359b5e1bb9576133731705ed5202c1ab588195c239a3a636021965408b284204e7d1d6082b7e3e89199cdc2c56fa4a')

package() {
  cd ${pkgname/-/_}-linux-x86_64-${pkgver}-archive/$pkgname/${pkgver%.*}

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/
  cp -arv bin host-linux-x64 target-linux-x64 "$pkgdir"/usr/lib/$pkgname/

  # create symlinks in /usr/bin/
  install -vdm 755 "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin/ ../lib/$pkgname/bin/{nsys,nsys-ui}

  # install documentation
  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -arv docs/* "$pkgdir"/usr/share/doc/$pkgname/

  # install license
  install -vDm 644 ../../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # install desktop entry
  install -vDm 644 -t "$pkgdir"/usr/share/applications/ "$srcdir"/$pkgname.desktop
}
