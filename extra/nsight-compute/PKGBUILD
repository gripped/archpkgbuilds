# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-compute
pkgver=2026.1.0.9
pkgrel=2
pkgdesc="Interactive profiler for NVIDIA CUDA and OptiX"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/nsight-compute"
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus
  fontconfig
  glib2
  glibc
  libatomic
  libcap
  libdrm
  libelf
  libgcc
  libglvnd
  libpng
  libstdc++
  libx11
  libxcb
  libxext
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxshmfence
  mesa
  nspr
  nss
  openssl
  python
  sqlite
  wayland
  xcb-util
  xcb-util-cursor
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  zlib
  # there are bundled libs: boost, gcc-libs, icu, libssh, libz, openssl, qt6, zstd
)
optdepends=(
  'cuda: for profiling on the local system'
)
options=(!debug !strip)
source_x86_64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz)
source_aarch64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-sbsa/${pkgname/-/_}-linux-sbsa-$pkgver-archive.tar.xz)
source=(nsight-compute.desktop)
b2sums=('3dc305bcdbf6927a3645ce4c2bb4e251d45f3fe026710f54c8cc5949c8037780df0b75b5f76e4052cdb5992bc5f88d6ef582966d7b9f78e0a594b4dfc87e7e67')
b2sums_x86_64=('50dbb935099f4503cb1ff3a32c23fb0d56c03bfa57c4e1961b02e9920746ade0c5605cb0ba51860b6d7edfa07fc7850b9532d33af0216d674c5187a81c390b97')
b2sums_aarch64=('a50821e6112a7298968af3a0a26152b313d259eb3398c8dfa67f7410359120a9a57b7f56c9941bed9801b38c2d4793fbd1fbaf9cf39122113603947d024f3ba3')

prepare()
{
  if [[ $CARCH = aarch64 ]]; then
    sed -i 's/glibc_2_11_3-x64/t210-a64/g' $pkgname.desktop
  fi
}

package() {
  cd ${pkgname/-/_}-linux-*-${pkgver}-archive

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

  # change ncu_report to a proper Python package
  # (compare with https://pypi.org/project/ncu-report/ in a venv)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vdm 755 "$pkgdir$site_packages"/ncu_report/
  mv -v "$pkgdir"/usr/lib/nsight-compute/extras/python/ncu_report.py "$pkgdir$site_packages"/ncu_report/__init__.py
  mv -v "$pkgdir"/usr/lib/nsight-compute/extras/python/_ncu_report.so "$pkgdir$site_packages"/ncu_report/
  if [[ $CARCH = aarch64 ]]; then
    ln -srv "$pkgname"/usr/lib/nsight-compute/target/linux-desktop-t210-a64/libnvperf_host.so "$pkgdir$site_packages"/ncu_report/
  else
    ln -srv "$pkgname"/usr/lib/nsight-compute/target/linux-desktop-glibc_2_11_3-x64/libnvperf_host.so "$pkgdir$site_packages"/ncu_report/
  fi

  # recompile pycache to strip $pkgdir from embedded paths
  python -m compileall "$pkgdir$site_packages"
}
