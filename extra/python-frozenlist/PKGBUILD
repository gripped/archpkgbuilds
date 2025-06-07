# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python-frozenlist
pkgver=1.6.1
pkgrel=1
pkgdesc='FrozenList is a list-like structure which can be made immutable'
arch=('x86_64')
url='https://github.com/aio-libs/frozenlist'
license=('Apache-2.0')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-expandvars'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('63776f6bbbc710d25a47a634df8020c347656d452d1912970ba9e94ffdaba28c999fe12ee6e9dca1622f9e7ab7ce60deda540bc3797f0ca6ec079c0d26b6cc84')
b2sums=('99e2bf456e9127b79940c53958f8aec377e00788d0778b08a55898f72d1f08ec1646ae7596d650687859d68b502e22360eebc33b82913b57f1877f15ba81bc22')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGES.rst README.rst
}

# vim: ts=2 sw=2 et:
