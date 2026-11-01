# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=mkdocstrings
pkgver=1.0.8
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/mkdocstrings"
license=(ISC)
depends=(
  mkdocs
  mkdocs-autorefs
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a8fb5a89b1b2166d4d57d28fbb8d76744762dd78d8eb19395ca0c41747dd9c0405d1131431ea2734bc327564f70010d57df176a1d92f8289ee7f81e32f43757b')

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
    --deselect 'tests/test_handlers.py::test_code_ids_are_prefixed' \
    --deselect 'tests/test_handlers.py::test_code_id_prefixing_preserves_raw_html' \
    --deselect 'tests/test_handlers.py::test_code_without_generated_ids_stays_without_ids' \
    --deselect 'tests/test_handlers.py::test_nested_autodoc_code_ids' \
    --deselect 'tests/test_plugin.py::test_disabling_plugin' \
    --ignore tests/test_api.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
