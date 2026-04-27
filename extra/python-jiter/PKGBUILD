# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
pkgver=0.14.0
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
b2sums=('97cf74095064b43405c62006732f049d67730fdeba4dc9ab519449dc153f0c6f5f8227d717da6f4f7e1ef191333947bb598d1aaf6b73e71a374325e795f707ea')

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
