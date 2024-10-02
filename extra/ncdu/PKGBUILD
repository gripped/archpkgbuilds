# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=ncdu
pkgver=2.6
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
sha256sums=('3f471ebd38b56e60dab80c27e3af1d826666957f02d9e8419b149daaf7ade505'
            'SKIP')
b2sums=('21d45bb428a56a040083165b9d467a526cd83eaa05b6f88b90a0b5dac0fa70dc4fd7e37ff52debc619b06103a95dad8ddc26fc9e77b6118eeb39aa97bfa0fd0e'
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
