# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
pkgver=0.16.0
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
b2sums=('0dca62900f9364ca985ec320b5bbd1f51c0224e3e60409754799159554e2578d8f3077b5d35d5f9d32cb62823b28b0c0d8fa1abc3d4e56a76be786e35a40d9f0')

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
