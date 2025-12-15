# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pytest-asyncio
pkgver=1.2.0
pkgrel=1
pkgdesc="Pytest support for asyncio."
arch=('any')
url="https://github.com/pytest-dev/pytest-asyncio"
license=('Apache-2.0')
depends=('python' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm')
checkdepends=('python-hypothesis')
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver")
b2sums=('a22f2014f4e0352a5f19fa43586cb157c4d2403a7937a1734a8e6daa921330e118a7461ebfad7c1f519c7a1a6e9997847ae76968bfda357d50fe66d084290720')

build() {
  cd pytest-asyncio
  python -m build -wn
}

check() {
  cd pytest-asyncio
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-asyncio
  python -m installer --destdir="$pkgdir" dist/*.whl
}
