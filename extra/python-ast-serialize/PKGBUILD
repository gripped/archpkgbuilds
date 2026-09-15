# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-ast-serialize
pkgver=0.11.1
pkgrel=1
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
provides=(python-ast_serialize)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('c553d7842c04ef5ac49bd9acf8eb555c3fbb80735f83764e2b9d63ae92a29b423833a738ce6de9dae66c06d4be531c42ccc0cf1ea0c7b6001a8204947c76afc2')

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
  test-env/bin/python test_ast_serialize.py
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm644 crates/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-ruff"
}
