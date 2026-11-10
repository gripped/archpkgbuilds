# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-systems
pkgver=2026.5.2.323
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
b2sums_x86_64=('7044b5da6805fb313d7c766fe4d05bb6038f8035f546da90eeb48d9a27ddb21475722e07f203085357f7dd1b65f5c6b10942511a9fbe06d2a8fe8826bb72ccfd')
b2sums_aarch64=('a6e15952e80139970970e60868ae7098e3c132770544d3c2d01820447e458db33ade71f7745b466dbffd8acc9b93f8d919fd6f5f632873d830d5013325a7388a')

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
