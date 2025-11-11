# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-pikepdf
pkgver=10.0.2
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=(x86_64)
url='https://github.com/pikepdf/pikepdf'
license=(MPL-2.0)
depends=(gcc-libs
         glibc
         python
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
sha256sums=('67a7b519f3ef26b707ea78122ef26dc2bfc7b3fa70c03d75422c7bd871b7c83c')

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
