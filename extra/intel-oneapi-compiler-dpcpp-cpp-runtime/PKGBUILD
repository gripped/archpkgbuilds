# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

_pkgbase='intel-oneapi-compiler-dpcpp'
_pkgname="${_pkgbase}-cpp"
pkgbase="${_pkgname}-runtime"
pkgname=("${_pkgname}-runtime" "${_pkgname}-runtime-libs")
pkgver=2026.2.0_863
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI Data Parallel C++ compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgbase}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-cpp-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb")
b2sums=('221b0a79fd9b3b7c126c05e933eb722a5439c1db15d2d811ea2bdfd597596f7eff57f9ff53f627bd9a64ad71bef0beab27f5d5d5be0567e8c87b4df256640578'
        'a75b6ec5dea89a74e42a8f1f5054a3500d630b3b14f6d2985334b43cd22b18a0056013e24c71e57689f50982e312489293935e5833b00d08b3e04029383bb88e'
        'a55238bb8c8bbc7bd1059b516a512ca8da088ea358ab0eb7843f2666d211d8339c3d773a3ed880a76202c735800a43431717063e28942334a9a263def1199058'
        'd715cba4e375f09e7ffbfd127fbe2e9d2bea690ad91412cb05ca5b52fca048979096bab82a89bbe6141fbd512270bf516072bf7ea0cda121c1124cfe96b81d01'
        'cbf140c62ab657826ffce3120c71e255f3296ce2aec1b135f8fd9c5d865a3c120fdb45b111d434c06c71ad835e2676d5585bac6951904c68544b4da85b0aa80b')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    "${_pkgbase}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
    "intel-oneapi-compiler-cpp-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
    "intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb"
)

build() {
    mkdir -p "${_pkgbase}-${pkgver}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/${_pkgbase}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-compiler-cpp-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    mkdir -p "${_pkgbase}-${pkgver}-libs"
    local _lib_path="/opt/intel/oneapi/compiler/${_majmin}"
    install -d "${_pkgbase}-${pkgver}-libs/${_lib_path}/lib"
    cd "${_pkgbase}-${pkgver}/${_lib_path}/lib"
    local _lib
    for _lib in libsycl*; do
        mv "${_lib}" "${srcdir}/${_pkgbase}-${pkgver}-libs/${_lib_path}/lib"
    done
}

package_intel-oneapi-compiler-dpcpp-cpp-runtime-libs() {
    depends=(
      'intel-oneapi-compiler-shared-runtime-libs'
      'intel-oneapi-openmp-offload'
      'intel-oneapi-umf'
      'intel-oneapi-tbb'
      'intel-oneapi-common'
    )
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Minimal runtime libraries"

    cp -a "${srcdir}/${_pkgbase}-${pkgver}-libs/opt" "${pkgdir}"

    # fix ldconfig warning by adjusting the symlinks to a semver lib
    local _lib=/opt/intel/oneapi/compiler/${_majmin}/lib/libsycl-preview.so
    local _ver=9.0.0
    ln -vsf "${_lib}.${_ver}" "${pkgdir}/${_lib}.${_ver%%.*}"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

package_intel-oneapi-compiler-dpcpp-cpp-runtime() {
    depends=(
      'intel-oneapi-compiler-shared-runtime'
      'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
      'intel-oneapi-common'
    )
    provides=(
      'intel-oneapi-compiler-dpcpp-cpp-common'
      'intel-oneapi-compiler-dpcpp-eclipse-cfg'
      'intel-oneapi-compiler-cpp-eclipse-cfg'
      'intel-oneapi-icc-eclipse-plugin-cpp'
    )
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Full runtime libraries and header files"

    cp -a "${srcdir}/${_pkgbase}-${pkgver}/opt" "${pkgdir}"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
