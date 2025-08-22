# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpds-py
pkgver=0.27.1
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
sha512sums=('e968ada064526a0fc79952a42a2d56da912120b025eb0931464aaba5ec4677c861c3cee3b5329e3e99d681af6ee7ed976f1e3a3dbe553c39a2f63fc341c577e9')
b2sums=('3047abffd1372ede8497534d990ea8ad104de1cfc6ab7e691b4130b8bf61d6ee83af74d5849718aab2c929687ad16c4b4487dc362aaf2b8c6d8ada3bf346d298')

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
