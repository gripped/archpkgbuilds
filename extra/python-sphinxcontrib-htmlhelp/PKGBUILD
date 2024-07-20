# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinxcontrib-htmlhelp
_name=${pkgname#python-}
pkgver=2.0.6
pkgrel=1
pkgdesc='Sphinx extension which renders HTML help files'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-htmlhelp
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-html5lib
  python-pytest
  python-sphinx
)
source=("git+$url.git#tag=$pkgver")
b2sums=('cf8c3f71b100b0a058c21bd7016c12daea0f64ca284cb0a8666ef8c905821dcaf5cad6bb0fa0d8d972cb5d8e8fd78c5c20fafa0198714287c611e179ba0b1cf7')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"${_name//-/_}"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
