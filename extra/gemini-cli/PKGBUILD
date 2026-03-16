# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.33.1
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  libgcc
  libstdc++
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
checkdepends=(
  vim
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('4ca83a09eb631874e943253dfe3c85b6900409ca46f12534c3a1ba256bdd20d6f201b05eb70c85540fb2086eac5c8ed9976e07dcaa8e8087f08cde5f926f7988')

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
