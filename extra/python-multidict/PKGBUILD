# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-multidict
pkgver=6.7.0
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
sha512sums=('00a993325a318ad2eeb2ac31855aad5a2c081d4f2d7df61458ae6d12fd2741ac8ddf9dd203ce514d4151e94a58652e0a9ddcfab7557febd0eff43a48c060617f')
b2sums=('2b8cdc7e90437d67edf166aa3cf85c1371b31db3785cc99b685c9247dbac468f63943388a15a3b55a5984ea763b65190b49c1b324883a5b5725853796f437ef6')

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
