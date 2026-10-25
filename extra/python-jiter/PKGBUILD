# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
pkgver=0.18.0
pkgrel=1
pkgdesc="Fast iterable JSON parser"
arch=(x86_64)
url="https://github.com/pydantic/jiter"
license=(MIT)
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-dirty-equals
  python-pytest
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5a9ffe1231398a9b5e51115006023b7dcec9df9b1f04a828648eb59a6ad590fd7b1a5f12d10ab57f44abd61fd9dad8dba3ce5a74bb60ccd8b33889e62b043be9')

build() {
  cd "${pkgname#python-}-$pkgver/crates/jiter-python"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}-$pkgver/crates/jiter-python"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python -m installer --destdir="$pkgdir" crates/jiter-python/dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
