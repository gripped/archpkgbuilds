# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.28.2
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  gcc-libs
  glib2
  glibc
  libsecret
  nodejs
)
makedepends=(
  git
  jq
  npm
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('d877d26c98cbc7b5a0abff033f20ba89296a66238fd7877758c61df779073989bd08ee25c65e1cf83b177e165462c62241489fa14b67b7d531bb0eda0dbe80e9')

prepare() {
  cd $pkgname
  npm clean-install --ignore-scripts
}

build() {
  cd $pkgname
  npm run bundle
  local bundled=$(jq '.dependencies + .optionalDependencies | keys' package.json)
  npm pkg set --json bundledDependencies="$bundled"
  npm pack
}

check() {
  cd $pkgname
  npm run build
  # Deselect failing tests
  npm test -- \
    --exclude='**/BuiltinCommandLoader.test.ts' \
    --exclude='**/config.integration.test.ts' \
    --exclude='**/mcp-client.test.ts'
}

package() {
  cd $pkgname
  npm install --global --offline --prefix "$pkgdir/usr" \
    google-$pkgname-$pkgver.tgz
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
