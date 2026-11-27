# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname="intel-oneapi-dpcpp-cpp"
pkgver=2026.2.0_863
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI DPC++/C++ Compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('b6595aec0c51eda758c3740fc7880b5d9ea73915e67f9db6e9985bab18fdb77eed043bd645c64b4f93576246c562bc30650a615e19fe278d9f0e9ae9479e2e40')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
)
depends=(
  'intel-oneapi-compiler-dpcpp-cpp-common'
  'intel-oneapi-compiler-dpcpp-cpp-runtime'
  'intel-oneapi-compiler-shared-runtime'
  'intel-oneapi-compiler-shared'
  'intel-oneapi-openmp-offload'
  'intel-oneapi-tbb'
  'intel-oneapi-dev-utilities'
  'intel-oneapi-common'
  'libgcc'
  'glibc'
  'bash'
  'zlib'
)
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
