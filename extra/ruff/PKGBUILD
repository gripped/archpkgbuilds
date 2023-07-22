# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ruff
pkgname=($pkgbase python-$pkgbase)
pkgver=0.0.279
pkgrel=1
pkgdesc='An extremely fast Python linter, written in Rust'
arch=(x86_64)
url="https://github.com/charliermarsh/$pkgname"
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
_archive="$pkgname-$pkgver"
source=($url/archive/refs/tags/v$pkgver/$_archive.tar.gz)
sha512sums=('2c6760280efdb1a4b719075eaf6cdcfdd6f1a6a6e1762a9dd3ce9c1c1b6ef1dd007722ed47cc97ac96a0b42c36888b34c76f1ee949a7a381a598468865efc319')
b2sums=('bdc4222a761cb761243d77a59736e3acdf036b54af6d18aceb302846891a2ec22f0b8ca736d5f71b22c84244fb578c7dfd22a2e9bcdf3b5569043a657756b7a4')

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
  $_target --generate-shell-completion bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname.bash"
  $_target --generate-shell-completion fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  $_target --generate-shell-completion zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

package_python-ruff() {
  cd "$_archive"
  _package_common
  depends=(python "$pkgbase")
  python -m installer -d "$pkgdir" target/wheels/*.whl
  rm -rf "$pkgdir/usr/bin"
}
