# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-pikepdf
pkgver=8.2.3
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=(x86_64)
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=(pybind11 python-build python-installer python-wheel python-toml python-setuptools)
depends=(python-lxml python-pillow python-packaging qpdf)
checkdepends=(python-pytest-xdist python-hypothesis python-psutil)
source=(https://github.com/pikepdf/pikepdf/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('3c18687100d1e34534a2d9309ac6c6a2a88a113ca66e793540fe1a0c7c451613')

build() {
  cd pikepdf-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pikepdf-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd pikepdf-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
