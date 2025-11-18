# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.27.0
pkgrel=2
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io/"
license=('MIT')
depends=(glibc)
makedepends=(go nodejs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4843e1e3391f5903c350e3186ff9cc523f51ceec6074e133604edef5394f16ebecf1774e570a0862c1ddb7ef76a4b0967a0724adcb4dfde1a8986cee4d612d4e')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

build() {
    cd "${pkgname}-${pkgver}"
    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/esbuild

    # Generate npm/esbuild/*
    node scripts/esbuild.js ./esbuild --neutral
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"

    # Detect node platform name (e.g., "linux-x64")
    node_platform=$(node -p 'process.platform + "-" + process.arch')
    node_dir="${pkgdir}/usr/lib/node_modules"
    npm_dir="${node_dir}/${pkgname}"
    install -Dm755 -d ${npm_dir}/lib
    install -Dm644 -t ${npm_dir}/lib npm/esbuild/lib/main.d.ts
    install -Dm644 -t ${npm_dir}/lib npm/esbuild/lib/main.js
    install -Dm644 -t ${npm_dir} npm/esbuild/package.json

    # Install the @esbuild/platform module
    install -m755 -d ${node_dir}/@esbuild/${node_platform}/bin
    ln -s /usr/bin/esbuild ${node_dir}/@esbuild/${node_platform}/bin/esbuild

    # Testing the node module
    # NODE_PATH=/usr/lib/node_modules node -e 'const esbuild = require("esbuild"); esbuild.transformSync("const x=1",{loader:"js"}); console.log("esbuild works")
}
