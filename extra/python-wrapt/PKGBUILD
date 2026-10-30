# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-wrapt
pkgver=2.5.2
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://github.com/GrahamDumpleton/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('mypy' 'python-pytest')
source=("git+https://github.com/GrahamDumpleton/wrapt.git#tag=$pkgver")
sha512sums=('1b6b05049651c074855e304bd4d37181c0abb639dc2338d45eae615924be172227d98e71dbe85aa9a92d4983879ff5bfb020e4fcc1b2f3dcf0606c94f43caa48')

build() {
  cd wrapt
  python -m build --wheel --no-isolation
}

check() {
  cd wrapt
  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  # Arch's mypy 2.4.0 adds a definition note to this version-sensitive fixture.
  test-env/bin/python -m pytest --deselect tests/conftest.py::mypy_patch_function_wrapper_t1
}

package() {
  cd wrapt
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
