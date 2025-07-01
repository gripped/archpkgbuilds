# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=ncdu
pkgver=2.8.2
pkgrel=3
pkgdesc='Disk usage analyzer with an ncurses interface'
url='https://dev.yorhel.nl/ncdu'
license=('MIT')
depends=(
  'ncurses'
  'glibc'
  'zstd'
)
makedepends=('zig')
arch=('x86_64')
source=("https://dev.yorhel.nl/download/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('022fa765d35a79797acdc80c831707df43c9a3ba60d1ae3e6ea4cc1b7a2c013d'
            'SKIP')
b2sums=('cc14e058c1951179abe762f5275a26577bb85607f86488ac3eabdba33b45d7c0ded9b59446b7573d40bdf11a66d94a246386401049c4455cf5d1cbe4802724e5'
        'SKIP')
validpgpkeys=('74460D32B80810EBA9AFA2E962394C698C2739FA') # Yoran Heling <projects@yorhel.nl>

build() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="build" zig build \
    --summary all \
    --global-cache-dir ../zig-global-cache \
    --prefix /usr \
    --search-prefix /usr \
    --release=safe \
    -Dtarget=native-linux.6.1-gnu.2.38 \
    -Dcpu=baseline \
    -Dpie=true
}

check() {
  cd "${pkgname}-${pkgver}"

  zig build test \
    --summary all \
    --global-cache-dir ../zig-global-cache \
    --prefix /usr \
    --search-prefix /usr \
    --release=safe \
    -Dtarget=native-linux.6.1-gnu.2.38 \
    -Dcpu=baseline \
    -Dpie=true
}

package() {
    depends+=(
      'libncursesw.so'
      'libzstd.so'
    )

    cd "${pkgname}-${pkgver}"

    cp -a build/* "$pkgdir"

    make install-doc PREFIX="${pkgdir}/usr"

    install --verbose -D --mode=644 LICENSES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
