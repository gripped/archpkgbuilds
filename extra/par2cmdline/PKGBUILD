# vim:set ts=2 sw=2 et:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline
pkgver=2.0.0
pkgrel=1
pkgdesc='A PAR 2.0 compatible file verification and repair tool'
url='https://github.com/BlackIkeEagle/par2cmdline'
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=('tar' 'cmake' 'ninja' 'cxxopts')
depends=(
  'libgcc'
  'libstdc++'
)
source=("https://github.com/Parchive/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/Parchive/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
sha512sums=('9ed2395ea2bd2a9d1520bc5641cb3223d545949c487576087cc4a180e8059f3bab86529c9b2199f05ffe26aac91415e5dd3b6c73bbf48ae88b61c7cd0bc73728'
            'SKIP')

validpgpkeys=(
  'DB2277BCD500AA3825610BDDDB323392796CA067'
)

build() {
    cmake \
        -S "$pkgname-$pkgver" \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DPAR2_KEEP_ASSERTS=ON \
        -DPAR2_SYSTEM_CXXOPTS=ON
    cmake --build build
}

check() {
    ctest --test-dir build
}

package() {
    DESTDIR=$pkgdir cmake \
        --install build \
        --prefix /usr
}
