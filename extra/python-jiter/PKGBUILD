# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
pkgver=0.13.0
pkgrel=2
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
b2sums=('e9136cfe9e9d183ee06efffc12e945f693f4e94e8ac1d398e10eaa9422db4fe63e49a439dba0324f9e627283acaccbd455cd43411f4e37c256747fd602562127')

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
