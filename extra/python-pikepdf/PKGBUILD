# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-pikepdf
pkgver=9.10.2
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
         python-packaging
         python-pillow
         qpdf)
makedepends=(git
             pybind11
             python-build
             python-installer
             python-setuptools
             python-toml
             python-wheel)
checkdepends=(python-hypothesis
              python-psutil
              python-pytest-xdist)
source=(git+https://github.com/pikepdf/pikepdf#tag=v$pkgver)
sha256sums=('328bef9f2cf4319f4a6a501b4a78d8af62a8b9c8c9047b8d8ab8ed5e74ac040f')

prepare() {
  cd pikepdf
  git revert -n 6f3aada222b8becb05e56b7e0706238c16a5045e # Fix build with older setuptools
}

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
