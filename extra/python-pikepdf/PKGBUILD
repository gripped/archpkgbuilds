# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-pikepdf
pkgver=8.13.0
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=(x86_64)
url='https://github.com/pikepdf/pikepdf'
license=(MPL-2.0)
depends=(gcc-libs
         glibc
         python
         python-deprecated
         python-lxml
         python-numpy
         python-packaging
         python-pillow
         qpdf)
makedepends=(pybind11
             python-build
             python-installer
             python-setuptools
             python-toml
             python-wheel)
checkdepends=(python-hypothesis
              python-psutil
              python-pytest-xdist)
source=(https://github.com/pikepdf/pikepdf/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c682e0928d4985ad47c6766e12600a5ebc44f9dafaf02f5a6b1e8af63e4621b5')

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
