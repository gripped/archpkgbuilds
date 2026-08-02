# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vpl-gpu-rt
pkgver=26.2.4
pkgrel=1
pkgdesc='Intel VPL runtime implementation for Intel GPUs (Tiger Lake and newer)'
arch=('x86_64')
url='https://github.com/intel/vpl-gpu-rt/'
license=('MIT')
depends=(
    'glibc'
    'intel-media-driver'
    'libdrm'
    'libgcc'
    'libstdc++'
    'libva')
makedepends=('cmake')
provides=('onevpl-intel-gpu' 'vpl-runtime')
conflicts=('onevpl-intel-gpu')
replaces=('onevpl-intel-gpu')
source=("https://github.com/intel/vpl-gpu-rt/archive/intel-onevpl-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-vpl-gpu-rt-disable-verbose-makefile.patch')
sha256sums=('c103d936d708a3910ef8572e9403aabf423197cfce6c8a6fcf870072b6564ada'
            'c6b17b7026d16d02c3cab7b5081366c24021a86fa173eaee5db310691ce76879')

prepare() {
    patch -d "vpl-gpu-rt-intel-onevpl-${pkgver}" -Np1 -i "${srcdir}/010-vpl-gpu-rt-disable-verbose-makefile.patch"
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S "vpl-gpu-rt-intel-onevpl-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='OFF' \
        -DMFX_ENABLE_AENC:BOOL='ON' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "vpl-gpu-rt-intel-onevpl-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
