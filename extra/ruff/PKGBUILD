# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ruff
pkgname=($pkgbase python-$pkgbase)
pkgver=0.0.286
pkgrel=1
pkgdesc='An extremely fast Python linter, written in Rust'
arch=(x86_64)
url="https://github.com/astral-sh/$pkgbase"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  maturin
  python-installer
)
options=(!lto)
_archive="$pkgbase-$pkgver"
source=($url/archive/refs/tags/v$pkgver/$_archive.tar.gz)
sha512sums=('c7e9c39b2379508cf6fd2abdd2168b9a7fc544901db64efd38b6665bedcc583f9760dd1ef549ef33d81ff7e1b383be588724b7315f4802137796dcc5dd3c088e')
b2sums=('93455817c42d64b219e88e054cc7ea9a8b17dab76d6af5bdadeeeff97ca82a78b8d26293637dd76a87fea53a457a93b51215e38c96feb7fd62b00d6f266bf37a')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_archive"
  maturin build --locked --release --all-features --target "$CARCH-unknown-linux-gnu" --strip
}

check() {
  cd "$_archive"
  cargo test -p ruff_cli --frozen --all-features
}

_package_common() {
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ruff() {
  cd "$_archive"
  _package_common
  local _target="target/$CARCH-unknown-linux-gnu/release/ruff"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_target"
  $_target --generate-shell-completion bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"
  $_target --generate-shell-completion fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"
  $_target --generate-shell-completion zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}

package_python-ruff() {
  cd "$_archive"
  _package_common
  depends=(python "$pkgbase")
  python -m installer -d "$pkgdir" target/wheels/*.whl
  rm -rf "$pkgdir/usr/bin"
}
