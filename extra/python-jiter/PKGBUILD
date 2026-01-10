# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
pkgver=0.12.0
pkgrel=2
pkgdesc="Fast iterable JSON parser"
arch=(x86_64)
url="https://github.com/pydantic/jiter"
license=(MIT)
depends=(
  gcc-libs
  glibc
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc579369476205f8081c2a9e1a23ae992abeecd8faf83662fc4850df07bcfe02')

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
