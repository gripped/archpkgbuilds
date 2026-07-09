# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-systems
pkgver=2026.1.3.425
pkgrel=1
pkgdesc="System-wide statistical sampling profiler with tracing features"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/nsight-systems"
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus
  fontconfig
  glib2
  glibc
  libdrm
  libglvnd
  libx11
  libxcb
  libxext
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxshmfence
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
source_x86_64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz)
source_aarch64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-sbsa/${pkgname/-/_}-linux-sbsa-$pkgver-archive.tar.xz)
source=(nsight-systems.desktop)

b2sums=('3f4fdc522ede1f4efa3ba91d369bbd1d576b0541f711558c309a697d33a1c9125c1ce3d430acc4e4ba060fa112ccb89c0d7e6284473b566502ca838202b790cc')
b2sums_x86_64=('48d71ec1d1c5bd3a515e6d70ed78a65e53094d34e8d3edb915f621c82f5f15ea1eb71482e62b78946073dfb45996afd4cd8f8fbedfee9532fe5e51c512e5c24e')
b2sums_aarch64=('605646342a3e52ec83f9aef91a9c58a6e1c2696f7b5f4aa4be79e379f5f851ac078cda16f62fc62143867c6d42093c787fdef13ca8e6ba3db2acddb62f7ffa4d')

package() {
  cd ${pkgname/-/_}-linux-*-${pkgver}-archive

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/
  cp -arv bin host-linux-* target-linux-* "$pkgdir"/usr/lib/$pkgname/

  # create symlinks in /usr/bin/
  install -vdm 755 "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin/ ../lib/$pkgname/bin/{nsys,nsys-ui}

  # install documentation
  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -arv documentation/* "$pkgdir"/usr/share/doc/$pkgname/

  # install license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # install desktop entry
  install -vDm 644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop
}
