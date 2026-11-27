# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Matteo Giordano <mail@matteogiordano.me>
pkgname=superfile
pkgver=1.6.1
pkgrel=1
pkgdesc='Pretty fancy and modern terminal file manager'
arch=('x86_64')
url='https://superfile.netlify.app/'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'exiftool: metadata plugin'
)
source=("https://github.com/yorukot/superfile/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cdca43cebee4b302104274084d67de31e244b4add39a247a76ab2ae3b255e7d6')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "./bin/spf"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 bin/spf -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
