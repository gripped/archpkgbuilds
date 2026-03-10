# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-systems
pkgver=2025.6.3.343
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

b2sums=('d77257e4507ec44c729a314d6c264e1aa7359b5e1bb9576133731705ed5202c1ab588195c239a3a636021965408b284204e7d1d6082b7e3e89199cdc2c56fa4a')
b2sums_x86_64=('cc3fb7e4574387f30e97ad21d19657a3b83281dfa2afaf49a4ea4618cb1f4c3cb3e0b014b4dfcae6b4fbd17e444e931eb438e2259e146cb779d5e4031e828090')
b2sums_aarch64=('dc97ca65b9a6d70c61341108a4cc5889113292d58f92ee6e6595a4fe25d7930ddcca8ea984429862f23e4a72059968aa8a04b4d391cdcde4785ec6a57e556930')

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
