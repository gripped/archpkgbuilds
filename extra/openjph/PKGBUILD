# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph
pkgname=(
    'openjph'
    'openjph-doc')
pkgver=0.27.3
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD-2-Clause')
makedepends=(
    'clang'
    'cmake'
    'doxygen'
    'git'
    'libtiff')
checkdepends=(
    'expat')
source=("git+https://github.com/aous72/OpenJPH#tag=$pkgver")
sha256sums=('a72612894b0f3b0752a8f2b0c703143445027a2f92e095a74c8a744bbb88ee2c')

build() {
    # https://github.com/aous72/OpenJPH/issues/186 https://github.com/aous72/OpenJPH/issues/186
    export CC='clang'
    export CXX='clang++'
    
    cmake -B build -S OpenJPH \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOJPH_BUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
    
    cd OpenJPH/docs
    doxygen
}

check() {
    ctest --test-dir build --output-on-failure
}

package_openjph() {
    depends=(
        'glibc'
        'libgcc'
        'libstdc++'
        'libtiff')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 OpenJPH/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openjph-doc() {
    pkgdesc+=' (documentation)'
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 OpenJPH/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' OpenJPH/docs/html "${pkgdir}/usr/share/doc/openjph"
}
