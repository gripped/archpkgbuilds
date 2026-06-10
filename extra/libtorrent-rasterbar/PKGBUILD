# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libtorrent-rasterbar
pkgver=2.0.13
pkgrel=1
epoch=1
pkgdesc='An efficient and feature complete C++ BitTorrent library implementation'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
license=('BSD-3-Clause')
depends=(
    'boost-libs'
    'glibc'
    'libgcc'
    'libstdc++'
    'openssl')
makedepends=(
    'boost'
    'cmake'
    'git'
    'python'
    'python-setuptools')
source=('libtorrent-rasterbar'::"git+https://github.com/arvidn/libtorrent.git#tag=v${pkgver}"
        'git+https://github.com/arvidn/libsimulator.git'
        'git+https://github.com/arvidn/try_signal.git'
        'git+https://github.com/paullouisageneau/boost-asio-gnutls.git'
        '010-libtorrent-rasterbar-fix-for-fortify-source-3.patch')
sha512sums=('8bfe4bfafc97f78fd82430dfd29a1d1a9d995332ea1d465e576010eb2454fef5dc8c681df66b6815e00a6f1189ba59331359ccf9f1f4f5fe1d1fadd1a181459d'
            'SKIP'
            'SKIP'
            'SKIP'
            '9f18a2e71b3924897f88b1c4148d3afe3bb29d1fe41a3166f0e3dfb64f1641f50ac25551e942241c7207e6692e4765df53e160ea9d3a8eca30879d6e299e9e1d')

prepare() {
    git -C libtorrent-rasterbar submodule init
    git -C libtorrent-rasterbar config --local submodule.simulation/libsimulator.url "${srcdir}/libsimulator"
    git -C libtorrent-rasterbar config --local submodule.deps/try_signal.url "${srcdir}/try_signal"
    git -C libtorrent-rasterbar config --local submodule.deps/asio-gnutls.url "${srcdir}/boost-asio-gnutls"
    git -C libtorrent-rasterbar -c protocol.file.allow='always' submodule update
    
    # https://github.com/arvidn/libtorrent/issues/7519
    # remove usage of malloc_usable_size() for _FORTIFY_SOURCE=3 compatibility
    patch -d libtorrent-rasterbar -Np1 -i "${srcdir}/010-libtorrent-rasterbar-fix-for-fortify-source-3.patch"
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libtorrent-rasterbar \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Dboost-python-module-name:STRING='python' \
        -Dpython-bindings:BOOL='ON' \
        -Dpython-egg-info:BOOL='ON' \
        -Dpython-install-system-dir:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
