# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libvpl
pkgver=2.16.0
pkgrel=1
pkgdesc='Intel Video Processing Library'
arch=('x86_64')
url='https://intel.github.io/libvpl/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc')
optdepends=(
    'intel-media-sdk: runtime implementation for legacy Intel GPUs'
    'vpl-gpu-rt: runtime implementation for Tiger Lake and newer GPUs')
makedepends=(
    'cmake')
provides=('onevpl' 'libvpl.so')
conflicts=('onevpl')
replaces=('onevpl')
options=('!emptydirs')
source=("https://github.com/intel/libvpl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6')

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S "libvpl-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DINSTALL_EXAMPLES:BOOL='OFF' \
        -DVPL_INSTALL_LICENSEDIR:PATH="share/licenses/${pkgname}" \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm "${pkgdir}/"{etc/vpl/vars.sh,usr/include/vpl/preview/{,legacy/}README.txt}
}
