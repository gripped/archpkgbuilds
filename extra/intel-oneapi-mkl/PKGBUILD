# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
# Contributor: huyz
# Contributor: Jingbei Li <i@jingbei.li>
pkgbase=intel-oneapi-mkl
pkgname=("${pkgbase}" "${pkgbase}-sycl")
pkgver=2026.2.0_881
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI Math Kernel Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-Simplified")
makedepends=('dpkg')
source=(
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-include-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-core-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-core-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-cluster-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-include-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb"
        "${pkgname}.conf"
        "${pkgname}.sh")
options=('staticlibs' '!debug')
noextract=(
		   "${pkgbase}-devel-${_majmin}-${_pkgver}_amd64.deb"
		   "${pkgbase}-classic-${_majmin}-${_pkgver}_amd64.deb"
		   "${pkgbase}-classic-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-classic-include-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-core-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-core-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-cluster-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-include-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb"
           )
sha256sums=('4970b03c9852cbb41c7dd6172a0eed7e973b107a5fa447a5544849c1f64b1ae9'
            '571bc76a1759ec1cc2218105a353722a48995fef089375a293add6d9babeb84b'
            'b8d8dcb4d5efd9b4ce93b729dc20ced172d82c253a47298a8db493b7cb24a802'
            'dfa0d17d2e0035f6a871f725e5b389f2c9ba9ef1f4f12d4f72b08a137f326c7a'
            'a482957e8c7e93ba8ad454c5f901e240ce30fb091cd8b17e094021cfba79f7a2'
            'fe1bdc90e0e1b3f36a34b5f4daa80a4991420466f8ea935956960728a4242fef'
            '7451eb75ed78bad6ce6586d6ed1f0df3c25aa92f0af23442c1f5bc38a3c8b655'
            '07d7a5ccf45bbf23315a7a28d946ab68f50dabfb0fe72cc5a5049f97d6907681'
            'fd776315f767ad1bfc6abe372c789a7f45f539aa3216dbcd6d1a971265b8c175'
            '5dce31986ef4cc28810e762ff40b4d22496daab056d728aec32ef69da45893bf'
            'efaf20421e97d2119da75b6c8febc330c91301c127991a4f7af14e6450775eea'
            '32cc91bc6fe3f60cb816af48ef47ed38a267c0c49d57dc66e8c42e394763e17a'
            '08775dadcd49456dd3dc7881956dfb8371fa713fd378e8687e4e53a5f8faa7e2'
            '2b6b3c52461525fb19fcfb2a755d25f6e8ce1a61086efafcf02f96aa14ad3eed'
            '5a4af02d3b85ce8c15b3c2589d5d9e14ded1a68f484120a52d9b0b4019001b2e'
            '3ebd218d852a76f658ac6e599e411dbbe3369df53de17238137c897e2a64f3e5'
            'e56b089f28e26a777cfea22be2fce11fad5ca00946a435e5af73e3f5f87100b7'
            '3b18f88702bc7a0e81710b0577e6f0ca2b0f21dcc01b6565a6e446c3ec7faa8c'
            '80a42c00a571b05de3a4919c77630e9cb19599b309eef20825940f40c423d517'
            'cd787d9843146ad5ccf28ec72311d76d95d6bb9e42974dd614d8b5aa76bb5bd9'
            '85a56750e03ad99a5b99e7296dcea411fb88c4a0a25e674c86ab48f5648d9ae9')

package_intel-oneapi-mkl() {
    pkgdesc="$_pkgdesc"
    depends=(
      'intel-oneapi-common'
      'intel-oneapi-tbb'
      'intel-oneapi-openmp'
      'glibc'
      'libgcc'
      'libstdc++'
      'bash'
    )
    replaces=('intel-mkl' 'intel-mkl-static')
    provides=('intel-mkl' 'intel-mkl-static')
    conflicts=('intel-mkl' 'intel-mkl-static' 'intel-oneapi-basekit')

    dpkg-deb -X ${pkgbase}-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-core-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-cluster-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-include-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-core-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"

    # symlink mkl version
    ln -s "$_majmin" "${pkgdir}"/opt/intel/oneapi/mkl/latest

    install -Dm644 ${pkgbase}.conf "${pkgdir}"/etc/ld.so.conf.d/${pkgbase}.conf
    install -Dm644 ${pkgbase}.sh "${pkgdir}"/etc/profile.d/${pkgbase}.sh

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s /opt/intel/oneapi/mkl/"${_majmin}"/share/doc/mkl/licensing "${pkgdir}"/usr/share/licenses/"${pkgname}"/mkl

    # pkgconfig
    cd "${pkgdir}"/opt/intel/oneapi/mkl/"${_majmin}"/lib/pkgconfig
    install -d "${pkgdir}"/usr/share/pkgconfig
    for _file in *.pc; do
        __file="$(basename ${_file})"
        ln -s /opt/intel/oneapi/mkl/"${_majmin}"/lib/pkgconfig/${__file} "${pkgdir}"/usr/share/pkgconfig/${__file}
        sed -e 's@prefix=.*@prefix=/opt/intel/oneapi/mkl/latest@g' -i ${__file}
    done

    # provide old intel-mkl
    install -d "${pkgdir}"/usr/bin
    install -d "${pkgdir}"/opt/intel/mkl
    install -d "${pkgdir}"/opt/intel/mkl/lib
    ln -sf /opt/intel/oneapi/mkl/latest/bin "${pkgdir}"/opt/intel/mkl/bin
    ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 "${pkgdir}"/opt/intel/mkl/lib/intel64
    ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 "${pkgdir}"/opt/intel/mkl/lib/intel64_lin
    ln -sf /opt/intel/oneapi/mkl/latest/include "${pkgdir}"/opt/intel/mkl/include
    ln -sf /opt/intel/mkl/bin/mkl_link_tool "${pkgdir}"/usr/bin/mkl_link_tool
}

package_intel-oneapi-mkl-sycl() {
    pkgdesc="$_pkgdesc (GPU offloading)"
    depends=(
      'intel-oneapi-mkl'
      'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
      'intel-oneapi-common'
      'intel-oneapi-compiler-shared-runtime-libs'
      'glibc'
      'libgcc'
      'libstdc++'
      'bash'
    )
    conflicts=('intel-oneapi-basekit')

    dpkg-deb -X ${pkgbase}-sycl-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-include-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s /opt/intel/oneapi/mkl/"${_majmin}"/share/doc/mkl/licensing "${pkgdir}"/usr/share/licenses/"${pkgname}"/mkl
}
