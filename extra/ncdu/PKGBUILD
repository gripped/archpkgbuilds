# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=ncdu
pkgver=2.7
pkgrel=1
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
sha256sums=('b218cc14a2bb9852cf951db4e21aec8980e7a8c3aca097e3aa3417f20eb93000'
            'SKIP')
b2sums=('10363968820da2dd3cb17c73eb3cba877ca229b896f44bbdd2b8b04c9e3d13aec8476c1968fc5c1841c856e51a1cba64f840e3320e5655bb2eb2bf7258a88f0e'
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
