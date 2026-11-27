# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgname=intel-oneapi-tcm
pkgver=1.6.0_178
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Thread Composability Manager"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/overview.html"
license=('LicenseRef-Intel-Simplified')
depends=(
  'intel-oneapi-common'
  'glibc'
  'libgcc'
  'libstdc++'
  'hwloc'
)
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('f9738d920cd903269eb52120e7f21741db4373fc82086506ad13e3bda3ebb8ff5ff9f41d30c756ebf66aed365cce11dfde2952792e49f660b4cf6796a58819c6')
noextract=("${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
conflicts=('intel-oneapi-basekit')

package() {
	ar x "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	tar xvf data.tar.xz -C "${pkgdir}"
	rm data.tar.xz

	local _prefix=/opt/intel/oneapi/tcm
	ln -vs "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

	# Bundled copy of the hwloc package, would shadow it via ld.so.conf
	rm -v "${pkgdir}/${_prefix}/${_majmin}"/lib/libhwloc.so*

	# libtbb loads libtcm.so.1 by soname
	install -d "${pkgdir}"/etc/ld.so.conf.d
	echo "${_prefix}/latest/lib" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

	install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
	ln -vs /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
