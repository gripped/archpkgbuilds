# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-matplotlib-inline
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Inline Matplotlib backend for Jupyter'
arch=(any)
url=https://github.com/ipython/matplotlib-inline
license=(BSD-3-Clause)
depends=(python-traitlets)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  ipython
  jupyter-notebook
  python-matplotlib
  python-nbval
  python-pytest
)
optdepends=(python-matplotlib)
source=("git+$url.git#tag=$pkgver")
b2sums=('3d99c463896dcf5342bf34c36d6747c36f015dd5ea768c4291ddba760c5a291829b86020ec4a9154c9e0e56dab2c71a167663525da307d9c0587a4c81018980f')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"${_name//-/_}"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
