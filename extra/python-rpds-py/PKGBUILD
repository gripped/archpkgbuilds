# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpds-py
pkgver=0.27.0
pkgrel=1
pkgdesc='Python bindings to the Rust rpds crate for persistent data structures'
arch=('x86_64')
url='https://github.com/crate-py/rpds'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-maturin'
  'python-installer'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('4bcf9ca856165658ae7647103d7fbf3143720364b07b6f2c91d31e717e897a12a290997dbde9ef3d976042cea09a772090642dd04cf8b21d7c1d9b15a8778785')
b2sums=('a2a60041b176666a80742bef52bf1d6f7a2d34375a2e465ae515a94825224f5cb756998877d49cd0be815f9889a91f5b27c4e283c17871da2ea0314a92155dd6')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
