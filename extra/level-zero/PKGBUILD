# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=level-zero
pkgname=(
    'level-zero-headers'
    'level-zero-loader')
pkgver=1.26.1
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
sha256sums=('ce8154d5ceca5895ff69818d9fd7a9281d74cce238b1c5ac75cb13a92c432db3')

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
        'gcc-libs'
        'glibc'
        'spdlog')
    
    mv loader "${pkgdir}/usr"
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
