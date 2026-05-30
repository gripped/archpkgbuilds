# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpds-py
pkgver=2026.5.1
pkgrel=1
pkgdesc='Python bindings to the Rust rpds crate for persistent data structures'
arch=(x86_64)
url='https://github.com/crate-py/rpds'
license=(MIT)
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  git
  python-build
  python-maturin
  python-installer
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('5c9c01a2d09da474036cd9dfddba6fed47f67f86f5d04273bbfaa21b5cdcf816f0ac4c5c12786b864377ba6f5b15dcd533a88a7bae3689de8170f5ee2e3b6ce9')
b2sums=('9bd400c289fcd915047905c06be588d85dc27e4e65e57dad3b8499dece23f3ece59c88aad28c6a018d78a6e06d8a5bc3ff67735908d0bf325f2d397cd49925ce')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
