# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Marc Tiehuis <marctiehuis@gmail.com>

pkgname=zig
pkgver=0.15.1
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64')
url='https://ziglang.org/'
license=('MIT')
options=('!lto')
depends=('clang' 'lld' 'llvm-libs')
makedepends=('cmake' 'llvm')
checkdepends=('lib32-glibc')
source=("https://ziglang.org/download/$pkgver/zig-$pkgver.tar.xz"
        "skip-localhost-test.patch"
        "skip-futex2-test.patch")
sha256sums=('816c0303ab313f59766ce2097658c9fff7fafd1504f61f80f9507cd11652865f'
            'eeb5f0f72035c52bf558ffc77a171a3ddf93eac7d663ef0c82826007763717a8'
            'eb30e0eb00e6ced4c99383f0658a0351f42882e303300ed1828d162d27171cd0')

prepare() {
    cd "$pkgname-$pkgver"

    patch -p1 -i ../skip-localhost-test.patch
    patch -p1 -i ../skip-futex2-test.patch
}

build() {
    cd "$pkgname-$pkgver"

    local cmake_vars=(
        CMAKE_INSTALL_PREFIX=/usr

        # The zig CMakeLists uses build type Debug if not set
        # override it back to None so makepkg env vars are respected
        CMAKE_BUILD_TYPE=None

        ZIG_PIE=ON
        ZIG_SHARED_LLVM=ON
        ZIG_USE_LLVM_CONFIG=ON

        ZIG_TARGET_TRIPLE=native-linux.6.1-gnu.2.38
        ZIG_TARGET_MCPU=baseline
    )
    cmake -B build "${cmake_vars[@]/#/-D}" .
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    # ugly workaround until test target is provided
    # https://github.com/ziglang/zig/issues/14240
    DESTDIR="./testinstall" cmake --install build
    ./testinstall/usr/bin/zig build test -Dconfig_h=build/config.h \
      -Dstatic-llvm=false \
      -Denable-llvm=true \
      -Dskip-non-native=true
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    DESTDIR="$pkgdir" cmake --install build
}
