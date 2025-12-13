# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.10.12
pkgrel=2
pkgdesc="Python 3 bindings for libalpm"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-or-later')
depends=('python' 'pacman')
makedepends=('git' 'python-setuptools' 'python-pkgconfig' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('2e7a33b090f7ea4b9547b9d90601e0afb5b50a5420060c40e98bc043c7ca80554809dac1e280430317ad989c7323d16c67879c6abea0b688da98c240f51ef925')

prepare() {
  cd "${pkgname}"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
