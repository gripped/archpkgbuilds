# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-wrapt
pkgver=2.0.1
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/GrahamDumpleton/wrapt.git#tag=$pkgver")
sha512sums=('d5cbd07a03abe7816839625fd1debf17499ac9972f7177bc55590f8ac441c512fb90ad818f562d18f0ce6d064a7da29f7e8fd62136602ec7f7c1da0a40eaedbe')

build() {
  cd wrapt
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd wrapt
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -k "not mypy"
}

package() {
  cd wrapt
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
