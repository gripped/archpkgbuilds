# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ruff
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.13
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
sha512sums=('07acc637bec2effa6ec904de061a4c3b5bf7a9fb3a6899966bdf1c8010425d49342a8c5115caf1c67a7a6622400028be7a80030ed100576de8344554ca0eec89')
b2sums=('cd2c87a2cb78d12f4bcb007b77d1a4dad3369706934fcb8f02f57d019b4ee16494e7273574ddee61b8b8346cec7fad2e3e8f02dd6962887915305cb7600c1433')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
