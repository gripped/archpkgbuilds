# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=intel-oneapi-dpcpp-debugger
pkgver=2026.2.0_138
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=3
pkgdesc='Intel OneAPI GDB'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('f85cb4421c8e58b9bd79190a3429aeb3eb93e550eb8cce586b8f5849ad56af33e152767c17e788cb72e29748bfdb846a611d13d48642c5c7586e314daea27548')
noextract=(
	"${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
)
depends=(
  'intel-oneapi-common'
  'sh'
  'glibc'
  'libgcc'
  'libstdc++'
  'zlib'
  'libffi'
)
provides=("$pkgname-eclipse-cfg")
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    local _deb_path='/opt/intel/oneapi/debugger'
    ln -s "${_deb_path}/${_majmin}" "${pkgdir}/${_deb_path}/latest"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
