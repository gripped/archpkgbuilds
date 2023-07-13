# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ruff
pkgname=($pkgbase python-$pkgbase)
pkgver=0.0.278
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
sha512sums=('4341704f2c812b96b8f36227bddebf6f6ccc7b15ffbc8ffa495ccbd43e9b90652d5a0a69a95e4cd90bccd451813c9a4441f2e264c46f9d539a5bad0ec61d1878')
b2sums=('b9fe82cbd599b5d8735f02a23dc53424898fae46b0fd42c1f8e80fca8565e189f45e14fa19050fc1192e54ef7637743f15eb2d398f0ef6da3ba6ab80edebf7e0')

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
