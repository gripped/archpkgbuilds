# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-yarl
pkgver=1.24.5
pkgrel=1
pkgdesc='Yet another URL library'
arch=('x86_64')
url='https://github.com/aio-libs/yarl/'
license=('Apache-2.0')
depends=(
  'glibc'
  'python'
  'python-idna'
  'python-multidict'
  'python-propcache'
)
makedepends=(
  'cython'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-expandvars'
)
checkdepends=(
  'python-hypothesis'
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0af5b02b769d16933e5918e7e8f2bcd78361388d45078a0ca12ca40e8601c0d799119a5344763bd7134bb28bf5f292e46ebe7c2625d66c4a3e39650ef0e68132')
b2sums=('f869680b7faf86a3fa205d80793ec70fa3f30b46d1648937a21350dabd90879d080dfb1c75ffd47aa0f06f44561a9843f3ac4f570196b749ea83d1d92122c939')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest -v --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
