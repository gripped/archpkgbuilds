# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=anywidget
pkgname=python-$_name
pkgver=0.9.21
pkgrel=2
pkgdesc="Reusable widgets made easy"
arch=(any)
url="https://anywidget.dev/"
license=(MIT)
depends=(
  ipython
  python
  python-comm
  python-ipywidgets
  python-psygnal
  python-traitlets
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-hatch-jupyter-builder
  pnpm
)
checkdepends=(
  python-pytest
  python-pydantic
  python-watchfiles
)
optdepends=(
  'python-watchfiles: for live reloading during development'
)
source=($_name-$pkgver.tar.gz::https://github.com/manzt/anywidget/archive/refs/tags/$_name@$pkgver.tar.gz)
b2sums=('dc8a11a45de43b4685968f7976131ed5f4f9f3f53521c71a6ed3328bf148c8c358acb8b4e96ecc5016576116b187816474102b052b3dabcee5612c67c139542f')

build() {
  cd $_name-$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    # skip failures due to psygnal and other comm mocking: AssertionError: assert not {140618835380272: <MockComm id='140618839307136'>}
    --deselect tests/test_descriptor.py::test_descriptor_with_psygnal
    --deselect tests/test_descriptor.py::test_descriptor_with_pydantic
    --deselect tests/test_descriptor.py::test_descriptor_with_msgspec
    --deselect tests/test_descriptor.py::test_descriptor_with_traitlets
    --deselect tests/test_descriptor.py::test_infer_file_contents
  )

  cd $_name-$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/usr/etc "$pkgdir"

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
