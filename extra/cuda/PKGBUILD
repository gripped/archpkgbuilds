# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Konstantin Gizdov <arch@kge.pw>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=(cuda)
pkgbase=cuda
pkgver=13.1.0
# Before upgrading, make sure that we ship at least this version of
# nvidia-utils as otherwise we'll get stuff such as #7.
_driverver=590.44.01
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit"
arch=(x86_64)
url="https://developer.nvidia.com/cuda-zone"
license=(LicenseRef-NVIDIA-CUDA)
depends=(
  opencl-nvidia
  python
  gcc
)
options=(!strip !debug staticlibs)
install=cuda.install
source=(https://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda.sh
        cuda.conf
        cublas.pc
        cuda.pc
        cudart.pc
        cufft.pc
        cufftw.pc
        cufile.pc
        curand.pc
        cusolver.pc
        cusparse.pc
        nppc.pc
        nppial.pc
        nppicc.pc
        nppicom.pc
        nppidei.pc
        nppif.pc
        nppig.pc
        nppim.pc
        nppi.pc
        nppist.pc
        nppisu.pc
        nppitc.pc
        npps.pc
        nvfatbin.pc
        nvidia-ml.pc
        nvjitlink.pc
        nvjpeg.pc
        nvrtc.pc
        fix-glibc242.patch
)
sha512sums=('a98092cb254d85fdcf422c57bae1bf2d5f7eba891d3613f8ab054ffc180b8b3d91535dd79661060c801582de4262651bf4675074b70b1dc2a24aace5ee6d9548'
            '93a52c9d1272aafc04ba07a74a41c1c3b3722107048cc1b40409406b4c9ba76cda8a8dc83c30d4a77996ef398732d5fb9615a4d47e3225d4a7ba6af82915b926'
            '3ef1d31adef59aaac464441aa1b8d92e706323492347e8ffec4ba1419576d3889791c8c13e8903dd79ceefc164cf473aef650105d1927cdb6676c936b66b2e45'
            '4fe5f183afde83c642f54c1f3c25042f09cce398d35efb151ef25ba932c2da7d1c15654d0c72ebb20dd02fd48c62d827d305f7afd40d3b2988509e0b27fd57af'
            '79c6929e1f3651efadea999ba3336e1ac8a6f4de76f1392d189f356de907551fe76cabc6dad006e2a45314545c7ece109c91e59586d00fa9e227dcbedef7a143'
            'e5a934529def4504662a710e5e012158acd4854cf3c0a429ac185ec291a22c38e67d0235fdea1d8a23fb97648e6d94b23754d51bcf5a492d8b79e3a0cbbe33c8'
            '8771042d4b2d307bbb78819150674a53a1b471b84a2bfe9324349a1189f3925617ae2fa0614e352de78f91c4ad161439822a7c6395f625ee24eacf58307a7510'
            'c0d69183b4ffcc89aa05521e66ec1af29cff66fe4f14ccc78033130e817d689131fce5707d8ef621db2c525d5f165d104dfdfd41e62e351d1cf4f08592c4cc51'
            '678c028ce8631d58cd21ad2eb35558d7cf47bd1986297395d2d4b3f2ff9fe38a709ffd050d62f9b714e709b7a769fa9dae36f31650031423d2908c92e1dc1aab'
            '9c430f63d83fe390cc3c7ad1bbbea9944dad25e2bd2c63bcd0de3757fa9ea84cb71f0260aff9295ee9d8da92aca7c51ed41847615ae5def4da5444dccfb753a4'
            '8836e5c512c8ab57e7caf09b4b54c21abcbbd3577dff3afa40394f1c4ce54e4bfa8475ffff94511cc410c8908f27ad223f8d2ff69c0ee35505e642d3dcdd0e10'
            'e04b19e003d93bf70fb42d0f31d0bbf4a2839bb15a38dc165930ed13d2966cf8785f7a0e36c4e2f401b271f6132df45efed56aea41fcc71b87ee1c00eee06fdb'
            '687f663b2241eefc098d4d8ae6961f587e40105345a00686bb75d33d83a0ea9da3bd1112271b388d697076923189025e82942ac45bc150fbdc7a66ac9c4327f1'
            'd55adbe3235c57e11bdfe0794e89083a8821b8a22a88ef14652772927c5c821e4003b559e3c1fe9ad679ffd267c6ff076b5c4002730588b74aeb926f6d514a20'
            '0e180c04154e10dbf5bbd2916f914e1332cb7138328353ed0d18b9626a16884a7a45df8ff29aa91d477962b9a45a2ea76f79d6aeef79b8f1bf4c3983382f0664'
            'eb50caaffd7b0db823dd939c5badccfae551096c280940f7714c0bc982ed729f414b51b439001c9af8fa49ab481982d6f7e41d348c9e5bac16c555dddd80d7bc'
            'f3ef0ac9acf410c692a7f939ecd132c086646762d8977ce618c6fffe892f45f81030481648fefb9b25a6b3ff28a0abdc99ad7e323a3d3cca98191fad787c2a10'
            '5a7756e697c64c0bcfadeb51b81d2a6ef1fd730ea2d824e6f3a8651386eab3f057ed5de571cbb0cb4750e8c54e24610148ceea5d6640a1e1bbfe0708f71892c1'
            '5bbebfbe6547236316d79f1f4e8592594098908867dd8c7e6837ae63d39935bd76353ecb9e6bd78f745c53e4e5ea2d8ce835d18fbd1cb3163c810002428616c0'
            'a976acd2b1c60e403f129b4109bfb63b55bf9a520874a92d35b4c9d40343cc772fb8cf903d99cdeb0d761c2a1cb2b20dd36b5c6585f1e3f38bf6d17b4a9abb30'
            'b30a9f563992f68f29820982b925121a4cfecd77c70241c92db6e1b737657b4bf464be1a4c1efac434b76226bd4bd7c415d64ccb7b271b24086f4a2acc67eb2b'
            '493075357d8fc0694d51d9e35a9ce542c050a6c67223147721f29516c38b61926ebb510c70bafd11b9e22865258253d2df682f2d606f05fd497f1aec9af7435b'
            '806fad0ef91e81f3c271b2307d4e7c37b4804e1eeb1a365686a649949331f8f352e7b11e043fac8757353f8c766d341e3f19b6b3ab114ffdbf753e7a572a3f3e'
            '1324c32d69c7b340cafa2edabc19b423d9753b0b71e0f1e4687da73cc4c1ece6b75fd8fec5164714d61f6f8704a65b0844c6aa9cca476e61e254fbc4744f0225'
            '48807886637e88948ff7022df4ae0809bccf6a515784f28b8f26383ea0faa2b9414b48f710b8800f94f9ac952889c289315ebb3a2dd062cc927cd76da0d88d39'
            '45c46afdecb816df0838088aa0ce8b543645e56836bead5b89a6c830bdf2535e344a373250a1dbcad0f065717cf1dfc18e6641c76b08c66b3592dadf5af31627'
            'd55fb8d81b2b6321e053383aaf0890d4e190a7f7a2982b709d581684109efd6d184d3b95659ec51c7b6f6a9340980faa257e5e657c38d86267a97dd2ca10c531'
            '4b087df6dd9139c133041bfe8572085621ab8a03ec442354bcde0a3aba9de0a52cc20385112f8f578ea32c5c046abcb0b8d093266047a0b7300c220ca1f6cd9c'
            '249eb2c25c876e1c67ea1e3f050b2a694dd68f51fc2b0ae34facb91bcf91b925e00551b7f10badba6ea14db02ed3bfaa7eeb3d98d9ce2f5e13f123575bd6b47e'
            '1ddc7ffb24f3a1d404a5e97dfbe0ffe232a4204a467dcfcc0ed48a4bd4be871995546b33de48fa0cecd138247a131f97d9f66070e8e75b5e0e0136e7beaff63e'
            'c7c7dbb0e21cb2342ede4bf730fe1191d59879e03151707c5519f4cafb64f1f7fdc3211f9d451ca789ab362de67cd43c2d4e1e2a714c8537a601b36cb63cb5b2')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec
}

build() {
  local _prepdir="${srcdir}"/prep

  cd "${srcdir}"/builds/

  # Delete some unnecessary files
  find . -name cuda-uninstaller -delete
  rm -r NVIDIA*.run bin
  rm -r integration  # contains only unnecessary/non-functional scripts
  rm version.json

  # Packaging cuda_nsight (Nsight Eclipse Edition Plugin) is not worth it
  rm -r cuda_nsight

  # nsight-compute and nsight-systems are separate packages
  rm -r nsight_compute nsight_systems

  # Move compute-sanitizer component
  mkdir -p "${_prepdir}"/opt/cuda/
  mv cuda_sanitizer_api/compute-sanitizer "${_prepdir}"/opt/cuda/
  # The directory should be now empty
  rmdir cuda_sanitizer_api
  # Add symlink for compute-sanitizer binary to appear in PATH
  mkdir -p "${_prepdir}"/opt/cuda/bin/
  ln -s ../compute-sanitizer/compute-sanitizer "${_prepdir}"/opt/cuda/bin/compute-sanitizer

  # Move remaining components
  mv EULA.txt "${_prepdir}"/opt/cuda/
  for lib in *; do
    # workaround for mv not merging the destination directory
    # (overwrite with --force since some files like EULA.txt or LICENSE come from multiple directories)
    cp -alr --force "$lib"/* "${_prepdir}"/opt/cuda/
    rm -r "$lib"
  done

  # Fix location of CUPTI headers and libs, otherwise some software fails to build
  # https://gitlab.archlinux.org/archlinux/packaging/packages/tensorflow/-/work_items/19#note_273055
  mv "${_prepdir}"/opt/cuda/extras/CUPTI/include/* "${_prepdir}"/opt/cuda/include/
  mv "${_prepdir}"/opt/cuda/extras/CUPTI/lib64/* "${_prepdir}"/opt/cuda/lib64/
  rmdir "${_prepdir}"/opt/cuda/extras/CUPTI/{include,lib64}

  # Remove broken links
  rm "${_prepdir}"/opt/cuda/include/include
  rm "${_prepdir}"/opt/cuda/lib64/lib64

  # Add a symlink lib->lib64 as some libraries might expect that (FS#76951)
  ln -s lib64 "${_prepdir}"/opt/cuda/lib

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${_prepdir}"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${_prepdir}"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$_prepdir"/opt/cuda -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda|g" "$f"
  done

  # Patch for compatibility with glibc 2.42
  patch -p1 -d "$_prepdir" -i "$srcdir"/fix-glibc242.patch
}

package_cuda() {
  replaces=('cuda-toolkit' 'cuda-sdk' 'cuda-static' 'cuda-tools')
  provides=('cuda-toolkit' 'cuda-sdk' 'libcudart.so' 'libcublas.so' 'libcusolver.so' 'libcusparse.so')
  optdepends=('gdb: for cuda-gdb'
              'glu: required for some profiling tools in CUPTI'
              'nvidia-utils: for NVIDIA drivers (not needed in CDI containers)'
              'nsight-compute: for profiling CUDA applications'
              'nsight-systems: for system-wide profiling'
              'rdma-core: for GPUDirect Storage (libcufile_rdma.so)')

  local _prepdir="${srcdir}/prep"
  mv "${_prepdir}"/* "${pkgdir}"

  # Install pkgconfig files
  install -vDm 644 -t "${pkgdir}"/usr/lib/pkgconfig/ "${srcdir}"/*.pc

  # Install profile and ld.so.config files
  install -vDm 644 "${srcdir}"/cuda.sh -t "${pkgdir}"/etc/profile.d/
  install -vDm 644 "${srcdir}"/cuda.conf -t "${pkgdir}"/etc/ld.so.conf.d/

  # Licenses
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -s /opt/cuda/EULA.txt "${pkgdir}"/usr/share/licenses/${pkgname}/EULA.txt
  ln -s /opt/cuda/README "${pkgdir}"/usr/share/licenses/${pkgname}/README
}
