# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Pig Fang <g-plane@hotmail.com>
# Contributor: SandaruKasa <sandarukasa+aur@ya.ru>
# Contributor: Evine Deng <evinedeng@hotmail.com>

pkgname=yazi
pkgver=25.12.29
pkgrel=2
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O"
url="https://github.com/sxyazi/yazi"
arch=("x86_64")
license=('MIT')
depends=('gcc-libs' 'ttf-nerd-fonts-symbols')
optdepends=(
	'ffmpeg: for video thumbnails'
	'7zip: for archive extraction and preview'
	'jq: for JSON preview'
	'poppler: for PDF preview'
	'fd: for file searching'
	'ripgrep: for file content searching'
	'fzf: for quick file subtree navigation'
	'zoxide: for historical directories navigation'
	'resvg: for SVG preview'
	'imagemagick: for image and font preview'
	'xclip: for X11 clipboard support'
	'xsel: for X11 clipboard support'
	'wl-clipboard: for Wayland clipboard support'
	'chafa: for ASCII image preview as fallback'
	'git: for Yazi package management'
)
makedepends=('cargo' 'imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sxyazi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('95d426eb933837bc499d3cddadaf845b919586d0105ffb831dcd5e085f73fd6c')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  VERGEN_GIT_SHA="Arch Linux" YAZI_GEN_COMPLETIONS=true cargo build --release --frozen --no-default-features
}

check() {
  cd "$pkgname"-$pkgver
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "target/release/ya" "$pkgdir/usr/bin/ya"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "assets/yazi.desktop" "$pkgdir/usr/share/applications/yazi.desktop"

  local r
  for r in 16 24 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps"
    magick assets/logo.png -resize "${r}x${r}" "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps/yazi.png"
  done

  cd "$pkgname-boot/completions"
  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}

# vim: ts=2 sw=2 et:
