# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbformat
pkgver=5.11.0
pkgrel=1
pkgdesc='The base implementation of the Jupyter Notebook format and Python APIs for working with notebooks'
arch=(any)
url='https://pypi.python.org/pypi/nbformat'
license=(BSD-3-Clause)
depends=(python
         python-fastjsonschema
         python-jsonschema
         python-jupyter-core
         python-traitlets)
makedepends=(git
             python-build
             python-installer
             python-hatch-nodejs-version)
checkdepends=(python-pytest
              python-testpath)
source=(git+https://github.com/jupyter/nbformat#tag=v$pkgver)
sha256sums=('67e4787379fe6c98fe32cc2aff4779705c78f61d7c3aac0addbab5f7d88d3a28')

build() {
  cd nbformat
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd nbformat
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -W ignore::Warning
}

package() {
  cd nbformat
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
