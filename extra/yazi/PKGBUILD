# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Pig Fang <g-plane@hotmail.com>
# Contributor: SandaruKasa <sandarukasa+aur@ya.ru>
# Contributor: Evine Deng <evinedeng@hotmail.com>

pkgname=yazi
pkgver=26.1.22
pkgrel=1
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
sha256sums=('83b8a1bf166bfcb54b44b966fa3f34afa7c55584bf81d29275a1cdd99d1c9c4c')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  VERGEN_GIT_SHA="Arch Linux" YAZI_GEN_COMPLETIONS=true cargo build --release --frozen --no-default-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/ya" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "assets/yazi.desktop" -t "$pkgdir/usr/share/applications/"

  for r in 16 24 32 48 64 128 256 512; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps"
    magick assets/logo.png -resize "${r}x${r}" "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps/yazi.png"
  done

  _install_completions "$pkgname-boot" "$pkgname"
  _install_completions "$pkgname-cli" "ya"
}

_install_completions() {
  pushd "$1/completions"
  install -Dm644 "$2.bash" "$pkgdir/usr/share/bash-completion/completions/$2"
  install -Dm644 "$2.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_$2" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "$2.elv" -t "$pkgdir/usr/share/elvish/lib/"
  popd
}

# vim: ts=2 sw=2 et:
