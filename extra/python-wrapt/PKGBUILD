# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-wrapt
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/GrahamDumpleton/wrapt.git#tag=$pkgver")
sha512sums=('df40e2ccee8e4cf834f0c5ceca5af289f3707949145b9d6b3cbf41b218749ba7217347e8586eaf4075734b69b537cb112b9b72a6c6710e8ec65a76b7120c90f5')

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
