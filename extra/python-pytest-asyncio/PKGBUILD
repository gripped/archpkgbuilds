# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pytest-asyncio
pkgver=0.25.3
pkgrel=1
pkgdesc="Pytest support for asyncio."
arch=('any')
url="https://github.com/pytest-dev/pytest-asyncio"
license=('Apache-2.0')
depends=('python' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis')
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver?signed")
b2sums=('729bd4c31d6cab7359cf3a0f58e7fc505b2e7393074f443b4b3ff8618f8cf129a9670092b07a6a86b7e8909eb95650031392b1d0be85db67bb5ea58296eaddfe')
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
