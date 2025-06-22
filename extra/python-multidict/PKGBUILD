# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-multidict
pkgver=6.5.0
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
  'python-objgraph'
  'python-perf'
  'python-psutil'
  'python-pytest'
  'python-pytest-codspeed'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c1a707f8fc7a81a5973cd0b24583cadef9c3c53a728e2da3686114635dfa1d5d08f60282e8115e359453ffd3152fedb7dd7f098b116b2ed1937aafef781bd1f4')
b2sums=('aaaaf67cf980be57245f6ae1e8ec4c67b2473c629754504fd6cedf4852ec7b633657b7a4d16cf90d5608f8989ed038ada674acab68fd85499a4bed4d4c0f0657')

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

# vim: ts=2 sw=2 et:
