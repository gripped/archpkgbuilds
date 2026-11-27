# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=intel-oneapi-tbb
pkgver=2023.2.0_492
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI Threading Building Blocks"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("Apache-2.0 AND LicenseRef-Intel-EULA-Developer-Tools AND LicenseRef-Intel-Simplified")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('88d788458b38a36850d019be8c1b084755f3f138a68b4a780d64de58514a5fa960b49b13f8389e7c9baee0a00cb6d27dd7729cf6efe4094ab631c4b6ce9de895'
        'f06f7f84bb7c996d541261ee1ecdba2db3d1b28406151ab7aa1f21b151f0f0a9fb23e54741f4e90fd3e9e9c79ca5d857788e1de4e97a5f50e2bfa6f546abbdb4')
depends=(
  'intel-oneapi-common'
  'intel-oneapi-tcm'
  'sh'
  'libgcc'
  'libstdc++'
  'glibc'
  'hwloc'
)
conflicts=('intel-oneapi-basekit')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${pkgname}-devel-${_majmin}-${_pkgver}_amd64.deb"
)

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-devel-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    # latest symlink
    local _prefix=/opt/intel/oneapi/tbb
    ln -s "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

    # fix pkgconfig
    sed "s@prefix=.*@prefix=${_prefix}/latest@g" \
        -i "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/tbb.pc
    install -d "${pkgdir}"/usr/share/pkgconfig
    ln -s "${_prefix}"/latest/lib/pkgconfig/tbb.pc "${pkgdir}"/usr/share/pkgconfig/tbb.pc

    # cmake
    sed "s@get_filename_component(_tbb_root.*@get_filename_component(_tbb_root ${_prefix}/latest ABSOLUTE)@g" \
        -i "${pkgdir}/${_prefix}/${_majmin}"/lib/cmake/tbb/TBBConfig.cmake
    install -d "${pkgdir}"/usr/share/cmake/TBB
    ln -s "${_prefix}"/latest/lib/cmake/tbb/TBBConfig.cmake "${pkgdir}"/usr/share/cmake/TBB/TBBConfig.cmake
    ln -s "${_prefix}"/latest/lib/cmake/tbb/TBBConfigVersion.cmake "${pkgdir}"/usr/share/cmake/TBB/TBBConfigVersion.cmake

    # ldconfig
    # The binary version of oneTBB may lag behind the open source release
    # that we package too. As long as there is no soname change in the open
    # source release, we can safely rely on the libraries installed to /usr/lib.
    # Only in case the sonames are not compatable, we have to revisit this issue
    # and see how we can fix the oneAPI stack. The open source oneTBB package
    # will always have priority.
    # FIXME Find a better way to handle this.
    # install -d "${pkgdir}"/etc/ld.so.conf.d
    # echo "${_prefix}"/latest/"$(sed -n 's/libdir=${prefix}\///p' "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/tbb.pc)" \
    #     > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s /opt/intel/oneapi/tbb/"${_majmin}"/share/doc/tbb/licensing "${pkgdir}"/usr/share/licenses/"${pkgname}"/tbb
}
