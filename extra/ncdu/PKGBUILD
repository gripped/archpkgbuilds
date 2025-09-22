# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=ncdu
pkgver=2.9.1
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
sha256sums=('bfd1094e1400ee89cfd59200eab940f025ccdc0c238067105c984a3c4857bf7e'
            'SKIP')
b2sums=('2a93b00c4147ade5b54e031ae7821a819bd3fcc2582699a2bf689272e3ac9c6059c5f2c48ab4d9245c19e49dbac1dd17d18c78e560888bd1082d9f4735e1c2dc'
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
