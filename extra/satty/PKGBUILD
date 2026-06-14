# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=satty
pkgver=0.21.1
pkgrel=1
pkgdesc="Modern screenshot annotation tool, inspired by Swappy and Flameshot"
arch=(x86_64)
url="https://github.com/gabm/satty"
license=(MPL-2.0)
depends=(
  fontconfig
  gdk-pixbuf2
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libadwaita
  libgcc
  pango
)
makedepends=(
  cargo
  git
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('1c8f45de5ca93fe4219d512bd9d18fddd2ed2d700edd920a875876a0674b38f0aaaa821dae680ab51e60a922de330663023e3108ba8ef2a326bb9c660e56cd5c')

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname
  install -vDm755 -t "$pkgdir/usr/bin" target/release/satty

  install -vDm644 completions/_satty \
    "$pkgdir/usr/share/zsh/site-functions/_satty"
  install -vDm644 completions/satty.bash \
    "$pkgdir/usr/share/bash-completion/completions/satty"
  install -vDm644 completions/satty.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/satty.fish"
  install -vDm644 completions/satty.nu \
    "$pkgdir/usr/share/nushell/completions/satty.nu"
  install -vDm644 completions/satty.elv \
    "$pkgdir/usr/share/elvish/lib/satty.elv"

  install -vDm644 -t "$pkgdir/usr/share/applications" satty.desktop
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" assets/satty.svg

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -va -t "$pkgdir/usr/share/doc/$pkgname" assets
}
