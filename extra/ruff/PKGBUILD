# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=($pkgbase python-$pkgbase)
pkgver=0.2.1
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
sha512sums=('882db6c23bc22db7f5755ab1f03a8c39ae20b0af0100fdffbf760c3f241ba3f42c8f75fd7bec3e633997584d566c4d7248c564abfff02df2c93a21284ba20bc9')
b2sums=('d682b0b5d706047eabdeb16dbad8b3de00f9b63e38b57994037e7ad72fce0155c8dcd1a7a38015525419c868a7de72e687cdb752b542d1429471bc477cec00f7')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd "$_archive"
  cargo test -p ruff --frozen --all-features -- --skip display_default_settings
}

_package_common() {
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ruff() {
  cd "$_archive"
  _package_common
  local _target="target/$(rustc -vV | sed -n 's/host: //p')/release/ruff"
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
