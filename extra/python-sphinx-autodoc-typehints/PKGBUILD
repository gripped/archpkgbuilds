# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
pkgver=3.9.5
pkgrel=1
pkgdesc='Type hints support for the Sphinx autodoc extension'
arch=(any)
url=https://github.com/tox-dev/sphinx-autodoc-typehints
license=(MIT)
depends=(
  python
  python-sphinx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-sphobjinv
  python-typing_extensions
)
source=("git+$url.git#tag=$pkgver")
b2sums=('02b36ced48e04509152e179294c7e45c30db6ba61e021d743c7a6763b96f3ec770834d7b08b404026cd78a6e4fd735262a92eec5d3dbc7827728d5e458d0c919')

build() {
  cd "$_pyname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${_pyname//-/_}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname"

  cd "$_pyname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
