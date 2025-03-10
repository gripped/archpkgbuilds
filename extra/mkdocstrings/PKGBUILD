# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocstrings
pkgver=0.28.3
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/mkdocstrings"
license=(ISC)
depends=(
  mkdocs
  mkdocs-autorefs
  mkdocs-get-deps
  python
  python-jinja
  python-markdown
  python-markupsafe
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
  python-dirty-equals
  python-pygments
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('552d3a4f0673b1210f612b92a7e44f06cb01817a7cc28cc9a8acb8bc95b44dfd')

build() {
  cd $pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests requires handlers, which are not yet packaged.
  # Ignored test test_api.py require python-griffe, also not packaged.
  test-env/bin/python -m pytest \
    --deselect 'tests/test_extension.py' \
    --deselect 'tests/test_handlers.py::test_extended_templates' \
    --deselect 'tests/test_handlers.py::test_nested_autodoc[ext_markdown0]' \
    --deselect 'tests/test_plugin.py::test_disabling_plugin' \
    --ignore tests/test_api.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
