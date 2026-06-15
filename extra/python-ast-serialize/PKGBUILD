# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-ast-serialize
pkgver=0.3.0
pkgrel=2
pkgdesc='Fast Python parser that generates a serialized AST'
arch=(x86_64)
url=https://github.com/mypyc/ast_serialize
license=(MIT)
depends=(
  glibc
  libgcc
)
makedepends=(
  cargo
  git
  python-build
  python-installer
  python-maturin
)
checkdepends=(python-pytest)
provides=(python-ast_serialize)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('43c51d391de340afb935e872d0c359a110d0b01a199ade1c01a174276394d423110f52dc17323ba7facb9dfbe15811a55afa606a45b1e50d111e539e969f55df')

prepare() {
  cd $pkgname
  cargo fetch --locked
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export MATURIN_PEP517_ARGS="--frozen"
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
