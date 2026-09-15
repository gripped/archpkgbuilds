# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-multidict
pkgver=6.8.0
pkgrel=1
pkgdesc='Asyncio-based multidict implementation for Python'
arch=('x86_64')
url='https://github.com/aio-libs/multidict'
license=('Apache-2.0')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-coverage'
  'python-objgraph'
  'python-perf'
  'python-psutil'
  'python-pytest'
  'python-pytest-codspeed'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1a978331fd0d7deabae84db7710258f5d7956197a2f1b97933fba523631077d732ab42f65e4f43477cc07e60ddd180807b73326ad660e2ba6fd8e9ba5b7f196b')
b2sums=('b8ef7da3fb565110418796c01258a71ba1ae2d8309868193ae6d73cf2c768f759578583c2d4436ca2127618e6a0f45815be259720f5a9f5d732c1968aff3df0b')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  cd tests
  ../test-env/bin/python -m pytest -v --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
