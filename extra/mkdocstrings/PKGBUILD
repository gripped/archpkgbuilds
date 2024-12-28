# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocstrings
pkgver=0.27.0
pkgrel=2
pkgdesc="Automatic documentation from sources, for MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/mkdocstrings"
license=(ISC)
depends=(
  mkdocs
  mkdocs-autorefs
  python
  python-click
  python-jinja
  python-markdown
  python-markupsafe
  python-platformdirs
  python-pymdown-extensions
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  mkdocs-material
  python-pygments
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b0092b9fde1161df831775c686d3bd20c950e0a7025dbad7b16a88abd29a91bf')

build() {
  cd $pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselected tests requires handlers, which are not yet pacakged.
  pytest \
    --deselect tests/test_extension.py \
    --deselect tests/test_handlers.py::test_extended_templates\
    --deselect tests/test_plugin.py::test_disabling_plugin
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
