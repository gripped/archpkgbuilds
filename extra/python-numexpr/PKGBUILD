# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-numexpr
pkgver=2.13.1
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python, NumPy, PyTables, pandas"
url="https://github.com/pydata/numexpr"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('11ed30449f53647d02ae18fef8521ddcf28dc914650bd9289eecb6c687200b78')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local relative_site_packages=$(realpath --relative-to=/usr "$site_packages")
  cd "test-env/$relative_site_packages"
  pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
