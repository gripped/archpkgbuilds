# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-scikit-build-core
pkgver=0.11.5
pkgrel=1
pkgdesc='Next generation Python CMake adaptor and Python API for plugins'
arch=(any)
url='https://github.com/scikit-build/scikit-build-core'
license=(Apache-2.0)
depends=(
  cmake
  ninja
  python
  python-packaging
  python-pathspec
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  pybind11
  python-cattrs
  python-fastjsonschema
  python-hatch-fancy-pypi-readme
  python-numpy
  python-pytest
  python-pytest-subprocess
  python-setuptools-scm
  python-typing_extensions
  python-validate-pyproject
  python-virtualenv
)
source=("$url/archive/v$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha512sums=('f48e9fdd817a07ac6cc3eb38a36be31f7696b11b1dd958c62f8626b0412b6d1813d8c7aed386aba1d3ea6424ab5ace96b4684d65c410d87fc7f76a5959be38ff')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: upstream hardcodes downloading the internet with pip:
# https://github.com/scikit-build/scikit-build-core/issues/720
check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not network'
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
