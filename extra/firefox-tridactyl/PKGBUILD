# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tridactyl
pkgver=1.24.5
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
arch=(any)
url=https://github.com/tridactyl/tridactyl
license=(Apache-2.0)
groups=(firefox-addons)
makedepends=(
  git
  node-gyp
  python
  strip-nondeterminism
  yarn
)
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('6b4fb4b70d5a83136e33dbf484e981175ef4d53df08a3113a2bfa2e507384a3329237a60253458e782476031579b683eaa3123ef79974368c77641d1c76fe7a2')
validpgpkeys=(15D03C86837936A0A638AA2D2BB8C36BB504BFF3) # Oliver Blanthorn <freedom4cows@gmail.com>

prepare() {
  cd tridactyl
  yarn install --frozen-lockfile --non-interactive
}

build() {
  cd tridactyl
  scripts/sign nosignstable
  strip-nondeterminism -t zip web-ext-artifacts/tridactyl-$pkgver.xpi
}

package() {
  cd tridactyl
  install -Dm644 web-ext-artifacts/tridactyl-$pkgver.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}
