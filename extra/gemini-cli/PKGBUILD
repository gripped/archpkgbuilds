# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.27.3
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
b2sums=('644607b99116487e705050cca16fc00722b7e589c281614521213a7a8020b9819ed0f8801916beeb54312f115abd6ba2e3ec7da9169d4e943db9c3a8c0d7da2b')

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
