# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgbase=intel-oneapi-openmp
pkgname=("${pkgbase}" "${pkgbase}-offload")
pkgver=2026.2.0_863
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI OpenMP runtime library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgbase}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgbase}-common-${_majmin}-${_pkgver}_all.deb")
b2sums=('3a147c733f65248456f15d8c476697693c595267045872ed822af8a47b13c70efa115dbee4bbd2d9220b168b2ffbdc3a9c76ec6ab93b645f72f0e83030a8d093'
        'f0b5590ad6e79faa3b4bcf5ae18ece83026802c2fb4c6efb4a6ac5d124afaba1616811903c23a8f017db2493d668142cecc45c7a1aa94e3961bf3970df811279')
noextract=(
    "${pkgbase}-${_majmin}-${_pkgver}_amd64.deb"
    "${pkgbase}-common-${_majmin}-${_pkgver}_all.deb"
)
_prefix=/opt/intel/oneapi/compiler

# Device runtime and compiler toolchain, relative to ${_prefix}/${_majmin}
_offload_files=(
    bin/compiler
    lib/clang
    lib/libarcher.so
    lib/libomptarget.so
    lib/libomptarget.sycl.wrap.so
    lib/libur_*
    opt/compiler/lib
    share/clang
)

build() {
    mkdir -p host offload
    local _deb
    for _deb in "${noextract[@]}"; do
        ar x "${srcdir}/${_deb}"
        tar xf data.tar.xz -C host
        rm data.tar.xz
    done

    cd "${srcdir}/host/${_prefix}/${_majmin}"

    # Separate debug info of libiomp5.so, invalid after strip
    rm lib/libiomp5.dbg

    # Upstream ships the unversioned names as copies, not symlinks
    local _lib _real
    for _lib in libur_loader libur_sanitizer_layer; do
        _real=$(basename lib/${_lib}.so.0.*)
        ln -sf "${_real}" lib/${_lib}.so.0
        ln -sf ${_lib}.so.0 lib/${_lib}.so
    done

    local _dest="${srcdir}/offload/${_prefix}/${_majmin}"
    local _file
    for _file in ${_offload_files[@]}; do
        install -d "${_dest}/$(dirname ${_file})"
        mv ${_file} "${_dest}/$(dirname ${_file})"
    done
    find . -type d -empty -delete
}

package_intel-oneapi-openmp() {
    depends=(
      'intel-oneapi-common'
      'intel-oneapi-tcm'
      'sh'
      'glibc'
      'libgcc'
    )
    conflicts=('intel-oneapi-basekit')

    cp -a host/opt "${pkgdir}"

    # latest symlink
    ln -s "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

    # fix permissions
    find "${pkgdir}" -type f \( -iname '*.so' -o -iname '*.so.*' \) -exec chmod +x '{}' \;

    # fix pkgconfig
    sed -e "s@prefix=.*@prefix=${_prefix}/latest@g" \
        -i "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/openmp.pc
    install -d "${pkgdir}"/usr/share/pkgconfig
    ln -s {"${_prefix}"/latest/lib/pkgconfig/,"${pkgdir}"/usr/share/pkgconfig/}openmp.pc

    # ldconfig
    install -d "${pkgdir}"/etc/ld.so.conf.d
    echo "${_prefix}"/${_majmin}/"$(sed -n 's/libdir=${prefix}\///p' "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/openmp.pc)" \
        > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s "${_prefix}/${_majmin}"/share/doc/compiler/licensing/openmp "${pkgdir}"/usr/share/licenses/"${pkgname}"/openmp
}

package_intel-oneapi-openmp-offload() {
    pkgdesc="Intel oneAPI OpenMP offload runtime, Unified Runtime and compiler tools"
    depends=(
      'intel-oneapi-openmp'
      'intel-oneapi-umf'
      'intel-oneapi-compiler-shared-runtime-libs'
      'level-zero-loader'
      'glibc'
      'libgcc'
      'libstdc++'
      'zlib'
    )
    optdepends=('intel-oneapi-compiler-dpcpp-cpp-runtime-libs: OpenMP and SYCL interoperability')
    conflicts=('intel-oneapi-basekit')

    cp -a offload/opt "${pkgdir}"

    # fix permissions
    find "${pkgdir}" -type f \( -iname '*.so' -o -iname '*.so.*' \) -exec chmod +x '{}' \;

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s "${_prefix}/${_majmin}"/share/doc/compiler/licensing/openmp "${pkgdir}"/usr/share/licenses/"${pkgname}"/openmp
}
