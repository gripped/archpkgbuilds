# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-pikepdf
pkgver=10.18.1
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=(x86_64)
url='https://github.com/pikepdf/pikepdf'
license=(MPL-2.0)
depends=(glibc
         libgcc
         libstdc++
         python
         python-fonttools
         python-jsonschema
         python-lxml
         python-packaging
         python-pillow
         python-referencing
         qpdf)
makedepends=(git
             nanobind
             pybind11
             python-build
             python-installer
             python-scikit-build-core)
checkdepends=(python-hypothesis
              python-psutil
              python-pytest-xdist)
source=(git+https://github.com/pikepdf/pikepdf#tag=v$pkgver)
sha256sums=('de76fd257d571842c2b4c9e0097d8dee352135078fc7520d140792d239f78043')

build() {
  cd pikepdf
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd pikepdf
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd pikepdf
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
