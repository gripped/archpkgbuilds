# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

_pkgname='intel-oneapi'
pkgname="${_pkgname}-common"
pkgver=2026.2.0_35
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel's oneAPI common variables and licensing"
arch=('any')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools AND LicenseRef-Intel-Simplified")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-oneapi-vars-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
		"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-vars-${_pkgver}_all.deb")
b2sums=('ab5596d882211b5ec1f6c80bf1c4cc5d0d14f3767145a58d2a8469fbb498d58cbc93bedf142ca8f326a19b9ca520807be2ecc429e8a3bcf28fcabec191fd1dd9'
        'e221e662a0db930b614d5fdc8cd3207ff85bc1b08ee52f3b11dae9f04eda3a604512a90b3587ca249929493dafb0c10715daffb7171051f4a9cac6371a254023'
        'e78bf2873effb3a857f95468615685346af08faad8bcee209c244df13ec055f08af94328bc51ce825e75664e2f87a33b8e538519d59f25b3050e95af1dd9bbb0')
depends=('sh')
optdepends=("procps-ng: Sourcing oneapi-vars.sh")
noextract=(
    "${pkgname}-oneapi-vars-${_majmin}-${_pkgver}_all.deb"
    "${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
    "${pkgname}-vars-${_pkgver}_all.deb"
)
conflicts=('intel-oneapi-basekit')

build() {
    mkdir -p vars licensing package

}

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-oneapi-vars-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz
    ln -sfT "${_majmin}" "${pkgdir}"/opt/intel/oneapi/common/latest

    ar x "${srcdir}/${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-vars-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ln -sfT "${_majmin}" "${pkgdir}"/opt/intel/oneapi/licensing/latest
    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /opt/intel/oneapi/licensing/"${_majmin}"/licensing/"${_majmin}"/license.htm "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.htm
    ln -s "${pkgname}" "${pkgdir}"/usr/share/licenses/"${_pkgname}"
    ls -lah "${pkgdir}"/usr/share/licenses
}
