# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.27.3
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io/"
license=('MIT')
depends=(glibc)
makedepends=(go nodejs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('169861c528ffb4943b8c7074017e1b65d97c3b598eb7be355e9842ce40ea75393e6ecc40a29e6a9d865175b354a5c74e18f3b024c480a3a09446a66db4ee02a4')

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
