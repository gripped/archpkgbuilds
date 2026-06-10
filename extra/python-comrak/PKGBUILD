# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-comrak
pkgver=0.0.12
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
sha512sums=('9d132174d8ce1f8e98e11af1f274cd56f7a4024321023de3919e534793ee218f31f261f76e52627da26d9da0e62ce440b1cca21627a3305003a2be3fa5f8552f')
b2sums=('7a3cb15c1b746264fba1053cc6e9fa954b39a51ac47e3de2e5275739f4bb645999e93a5841b7736296bd4f968d01e2eca9b4e66851863685be884fa3a46ac564')

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
