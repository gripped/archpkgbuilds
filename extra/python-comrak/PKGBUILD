# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-comrak
pkgver=0.0.15
pkgrel=1
pkgdesc='Python bindings for the Comrak Rust library, a fast CommonMark/GFM parser'
arch=(x86_64)
url='https://github.com/lmmx/comrak'
license=(BSD-2-Clause)
depends=(
  python
  glibc
  libgcc
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
  oniguruma
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=py-$pkgver")
sha512sums=('5fff5b360bac9c4abc49c57da95ce57c9a7a0747fcb85d195e506a33a47677d266a48f6838f38124523aaefc0ef2bcb172e32dba23f753aaa018b21747cc00f4')
b2sums=('9298b594536019b12c31659f1d8f4c6ddeed8730c4bdbb4221559b7e66960b7ef977980bed643311bb9774537b69a2fcbc0edd90951a89b7da1b9e282c053616')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  # https://archlinux.org/todo/lto-fat-objects/
  CFLAGS+=' -ffat-lto-objects'

  export RUSTONIG_DYNAMIC_LIBONIG=1

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
