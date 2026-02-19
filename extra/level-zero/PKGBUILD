# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=level-zero
pkgname=(
    'level-zero-headers'
    'level-zero-loader')
pkgver=1.27.0
pkgrel=2
pkgdesc='API for accessing low level interfaces in oneAPI platform devices'
arch=('x86_64')
url='https://github.com/oneapi-src/level-zero/'
license=('MIT')
makedepends=(
    'cmake'
    'git'
    'opencl-headers'
    'spdlog')
source=("https://github.com/oneapi-src/level-zero/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('b9f5d6c661a23cad78db1552c4951a1bb6f1628e4f737c68e69c3a23d64db2eb')

prepare() {
    printf '%s\n' "${pkgver##*.}" > "${pkgbase}-${pkgver}/VERSION_PATCH"
}

build() {
    cmake -B build -S "${pkgbase}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DSYSTEM_SPDLOG:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package_level-zero-headers() {
    pkgdesc+=' (headers)'
    #arch=(any) # Not supported for now, maybe later
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove loader files
    [ -d 'loader' ] && rm -rf loader
    install -d loader/lib
    mv "${pkgdir}/usr/lib"/*so* loader/lib
}

package_level-zero-loader() {
    pkgdesc+=' (loader)'
    depends=(
        'glibc'
        'libgcc'
        'libstdc++'
        'spdlog')
    
    mv loader "${pkgdir}/usr"
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
