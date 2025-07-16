# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>

_pkgauthor=rfjakob
pkgname=gocryptfs
pkgver=2.6.0
pkgrel=1
pkgdesc='Encrypted overlay filesystem written in Go.'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')
depends=('glibc' 'openssl' 'fuse3')
makedepends=('go' 'pandoc' 'man-db')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_src-deps.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/${_pkgauthor}/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_src-deps.tar.gz.asc"
)
sha256sums=('b3848626b90d0fe87aaf81cc6ef0983089d1a93653f30e7d9b89c7c6e872a4f5'
            'SKIP')
validpgpkeys=('FFF3E01444FED7C316A3545A895F5BC123A02740')

build() {
    cd "${srcdir}/${pkgname}_v${pkgver}_src-deps"

    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor"
    make build
}

package() {
    cd "${srcdir}/${pkgname}_v${pkgver}_src-deps"
    make DESTDIR="${pkgdir}" install
}
