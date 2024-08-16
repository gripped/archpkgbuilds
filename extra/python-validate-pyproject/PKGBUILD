# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.19
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-fastjsonschema' 'python-packaging' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver")
sha512sums=('b4d5092700cb8d666e0abb5eb14438c1fa9a10ee6786da2f208593329b81354dc86c0308e7f2bbda3b74730563d286ad5312df621740184b931feb9c13eb74dc')

prepare() {
  cd validate-pyproject
}

build() {
  cd validate-pyproject
  python -m build -wn
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd validate-pyproject
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject
  python -m installer --destdir="$pkgdir" dist/*.whl
}
