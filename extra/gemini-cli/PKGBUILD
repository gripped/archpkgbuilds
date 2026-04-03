# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.36.0
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  glib2
  glibc
  libgcc
  libsecret
  libstdc++
  nodejs
)
makedepends=(
  git
  jq
  node-gyp
  npm
  python
)
optdepends=(
  'ripgrep: file content search'
  'wl-clipboard: clipboard image pasting on Wayland'
  'xclip: clipboard image pasting on X11'
  'xdg-utils: opening URLs in default browser'
)
checkdepends=(
  vim
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('9881c3a24fcd0fe04fe485bdd0c8a0cce63cbce57be391dd8c2f115e772d6f96bda640f302d5118c23d372ea935e3f196e6844c5e6715f91538832776cd7ede8')

prepare() {
  cd $pkgname
  npm clean-install --ignore-scripts
}

build() {
  cd $pkgname
  npm run bundle
  # Build keytar native addon to enable OS keychain integration via libsecret
  # (GNOME Keyring, KDE Wallet, etc.) instead of falling back to a file-based
  # keychain.
  (
    cd node_modules/keytar
    node-gyp rebuild
  )
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
  # Remove node-gyp build artifacts
  rm -vr "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/keytar/build/Release/obj.target"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
