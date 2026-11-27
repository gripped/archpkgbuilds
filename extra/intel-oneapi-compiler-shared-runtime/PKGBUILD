# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

_pkgname='intel-oneapi-compiler-shared'
pkgbase="${_pkgname}-runtime"
pkgname=("${_pkgname}-runtime" "${_pkgname}-runtime-libs")
pkgver=2026.2.0_863
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI compiler runtime libraries"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
depends=('level-zero-loader')
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb")
b2sums=('00448932697de803c5128aa4d78a3bb6eff40b79fd573dbf037732e63745631b9be7e63cee2709ac7e088c40d7c205c2b9c91234867cd4d6ab62f3cc7b739bcc'
        '56b83f9cfa10ded3b3abff38574ee162f2d87b55691e014f42721b485c827be378fb9764bbd2a003f5b9e834d3781558f9d87bc39765e8fe2447740dcab6da4f')

noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
)
_lib_path='/opt/intel/oneapi/compiler'

prepare() {
    mkdir -p "${_pkgname}-${pkgver}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${_pkgname}-${pkgver}"
    rm data.tar.xz
    ar x "${srcdir}/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgname}-${pkgver}"
    rm data.tar.xz
}

build() {
    mkdir -p libs
    install -d "libs/${_lib_path}/${_majmin}/bin"

    local _bin
    for _bin in compiler icx-cc icx-cl sycl-ls sycl-trace; do
        mv "${_pkgname}-${pkgver}/${_lib_path}/${_majmin}/bin/${_bin}" \
           "libs/${_lib_path}/${_majmin}/bin"
    done

    local _lib
    install -d "libs/${_lib_path}/${_majmin}/lib"
    for _lib in libsvml.so libirng.so libimf.so libintlc.so libintlc.so.5; do
        mv "${_pkgname}-${pkgver}/${_lib_path}/${_majmin}/lib/${_lib}" \
           "libs/${_lib_path}/${_majmin}/lib"
    done

    mkdir -p most
    cp -a "${_pkgname}-${pkgver}"/* most
}

package_intel-oneapi-compiler-shared-runtime-libs() {
    depends=(
      'intel-oneapi-common'
      'intel-oneapi-openmp'
      'glibc'
      'libgcc'
      'libstdc++'
      'zlib'
    )
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Minimal compiler libraries"

    cp -a libs/* "${pkgdir}"

    # allow libs to be found
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/lib" >> "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

package_intel-oneapi-compiler-shared-runtime() {
    depends=(
      'intel-oneapi-openmp'
      'intel-oneapi-common'
      'intel-oneapi-compiler-shared-runtime-libs'
      'libxml2'
      'glibc'
      'libgcc'
      'libstdc++'
      'level-zero-loader'
      'zlib'
    )
    provides=("${_pkgname}-common" "opencl-driver")
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}"

    cp -a most/* "${pkgdir}"

    echo '/opt/intel/oneapi/compiler/latest/lib/libintelocl.so' > 'intelocl.icd'
    install -Dm644 'intelocl.icd' "$pkgdir/etc/OpenCL/vendors/intelocl.icd"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
