# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Grzegorz Koperwas <admin@grzegorzkoperwas.site>

pkgname=awww
pkgver=0.12.0
pkgrel=1
pkgdesc="An Answer to your Wayland Wallpaper Woes"
arch=(x86_64)
url="https://codeberg.org/LGFae/awww"
license=(GPL-3.0-only)
depends=(
  dav1d
  glibc
  libgcc
  lz4
)
makedepends=(
  cargo
  scdoc
  wayland
  wayland-protocols
)
provides=(swww)
replaces=(swww)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c2e914a2b75421ba4abe7755bf9bdfaabd27a6bbb955120894eb7d74d5cbe66fcc6eedd67c89295328be40cc38ef6a0c7ccf2c0c19422451d860bb8501fc7ae7')

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname
  cargo build --frozen --release --all-features

  # manpages
  ./doc/gen.sh
}

check() {
  cd $pkgname
  cargo test --frozen --all-features
}

package() {
  cd $pkgname
  install -vDm755 -t "$pkgdir/usr/bin" \
    target/release/awww \
    target/release/awww-daemon

  install -vDm644 completions/awww.bash "$pkgdir/usr/share/bash-completion/completions/awww"
  install -vDm644 completions/awww.fish "$pkgdir/usr/share/fish/vendor_completions.d/awww.fish"
  install -vDm644 completions/_awww "$pkgdir/usr/share/zsh/site-functions/_awww"
  install -vDm644 completions/awww.elv "$pkgdir/usr/share/elvish/lib/awww.elv"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/man/man1" ./doc/generated/*.1
}
