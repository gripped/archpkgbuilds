# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pytest-asyncio
pkgver=0.25.1
pkgrel=1
pkgdesc="Pytest support for asyncio."
arch=('any')
url="https://github.com/pytest-dev/pytest-asyncio"
license=('Apache-2.0')
depends=('python' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis')
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver?signed")
b2sums=('cec5ef1a3c474c85174863e3aa1bef76821b973f981160db3088b3ae04f42009c67c33432677e500282784e1c3948216cd363e38bd5dd75655c43c7873b92ffa')
validpgpkeys=('856F4E797CAB2AA5A0A967E1F0827C47163A10D6') # Michael Seifert <m.seifert@digitalernachschub.de>

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
