# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgname=intel-oneapi-umf
pkgver=1.2.0_116
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Unified Memory Framework"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/overview.html"
license=('LicenseRef-Intel-Simplified')
depends=('intel-oneapi-common' 'intel-oneapi-tcm' 'glibc' 'hwloc')
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('d45a691a7fec86da6c0fff11478b2ab497a4c58df1f625ca2e017bc1c429a361dfc90bd2dcefe5fffa34704e9f1dffc7d706def6e8ef911bcbbe26dc3183c4fe')
noextract=("${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
conflicts=('intel-oneapi-basekit')

package() {
	ar x "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	tar xvf data.tar.xz -C "${pkgdir}"
	rm data.tar.xz

	local _prefix=/opt/intel/oneapi/umf
	ln -vs "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

	# Unified Runtime adapters need libumf.so.1, their RUNPATH is only $ORIGIN
	install -d "${pkgdir}"/etc/ld.so.conf.d
	echo "${_prefix}/latest/lib" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

	install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
	ln -vs /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
