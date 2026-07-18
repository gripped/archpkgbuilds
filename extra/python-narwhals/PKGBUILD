# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=python-narwhals
_name=${pkgname#python-}
pkgver=2.24.0
pkgrel=1
pkgdesc="Extremely lightweight and extensible compatibility layer between dataframe libraries"
arch=('any')
url="https://narwhals-dev.github.io/narwhals/"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-uv-build)
# Not included, as it's not currently packaged for [extra]: duckdb
optdepends=('python-pandas: for Pandas support'
            'python-pyarrow: for PyArrows support'
            'python-polars: for Polars support')
checkdepends=(
	python-pytest{,-env}
	python-hypothesis
	python-pandas
	python-pyarrow
	python-polars
)
source=($pkgname-$pkgver.tar.gz::https://github.com/narwhals-dev/narwhals/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('41ff477bec443680817d4c1b411d25574319ca0422e3d4a5930876e4b727d563')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Not all supported data frames are packaged, only run tests for those
  # that are
  test-env/bin/python -P -m pytest --constructors "pandas,pandas[pyarrow],polars[eager],pyarrow"
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
