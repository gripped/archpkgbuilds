# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-wrapt
pkgver=2.2.2
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://github.com/GrahamDumpleton/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/GrahamDumpleton/wrapt.git#tag=$pkgver")
sha512sums=('6385c8f202af2f8c607d5fa369b0496cf4c63b8584104323dfd06e7ccf76f526d438360767418f1d7e5d1b5e0500f48931d86fee69090b805040c8c4fd32801e')

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
