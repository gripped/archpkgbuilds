# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=intel-oneapi-dev-utilities
pkgver=2026.2.0_51
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI Dev Utilities"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb")
b2sums=('04abdefa201e138622aebabc9c6a5ab5ad107040070ea5d9ef3a8ff8b48a49f230396ec6cceaf00b0d56777ab7db17ae478d693a9c028f440dd7d96cc6842a9f'
        '5f7a967e4d11f073516e28e368ab08a8f609d9a4031cb9684493ced0d27a8bafae312f61bb7ef4cae35c24fedf19a59be046ccf52d426b395718dd977555a443')
depends=('intel-oneapi-common')
provides=("${pkgname}-eclipse-cfg")
conflicts=('intel-oneapi-basekit')

noextract=(
	"${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	"${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
)

package() {
  cd "${srcdir}"
  ar x ${pkgname}-${_majmin}-${_pkgver}_amd64.deb
  tar xvf data.tar.xz -C "${pkgdir}"
  rm data.tar.xz

  ar x ${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb
  tar xvf data.tar.xz -C "${pkgdir}"
  rm data.tar.xz

  local _dev_path='/opt/intel/oneapi/dev-utilities'
  ln -s "${_dev_path}/${_majmin}" "${pkgdir}/${_dev_path}/latest"

  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
